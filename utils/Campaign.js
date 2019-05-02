const db		    = require('../db/postgres');
const model		    = require('../models');
const CampaignMgnt  = require('../campaign/cache');
const geolib        = require('geolib');

const distinct = (value, index, self) => {
    return self.indexOf(value) === index;
}

async function getUsableLocations(userId) {
    let f = [];
    let suLocations = await model.location_master.findAll({include:[{model: model.user,attributes: [],include: {model: model.roles, attributes: [], where: {superadmin: true }}}]});
    let locations = await model.location_master.findAll({where: { userId: userId }});
    suLocations = JSON.parse(JSON.stringify(suLocations));
    suLocations.map(s => { f.push(s) });
    locations = JSON.parse(JSON.stringify(locations));
    locations.map(s => { f.push(s) });
    return f.filter(distinct);
}

module.exports.createImageCampaign = async (name, title, start, end, body, action, content, app, locations, userId, filters) => {
    let campaign = undefined;
    try {
        campaign = await model.campaign.create({ name:name, title: title, start_timestamp: start, end_timestamp: end, body: body, action: action, contentId: content, applicationId: app, type: 'IMAGE', userId: userId, filter: filters  });
        let id = campaign.id;
        locations.map(async location => {
            await model.CampaignLocation.create({campaignId: id, locationMasterId: location});
        });
        CampaignMgnt.addToCache(id);
        return campaign;
    } catch(err) {
        return err;
    }
}

module.exports.createTextCampaign = async (name, title, start, end, body, action, app, locations, userId, filters) => {
    let campaign = undefined;
    try {
        campaign = await model.campaign.create({ name:name, title: title, start_timestamp: start, end_timestamp: end, body: body, action: action, contentId: null, applicationId: app, type: 'TEXT', userId: userId, filter: filters });
        let id = campaign.id;
        locations.map(async location => {
            await model.CampaignLocation.create({campaignId: id, locationMasterId: location});
        });
        CampaignMgnt.addToCache(id);
        return campaign;
    } catch(err) {
        return err;
    }
}

module.exports.findAllCampaigns = (userId) => {
    return model.campaign.findAll({ where: { userId: userId }, include: [{model: model.application}, {model: model.content}]})
        .then(campaigns => { return campaigns; })
        .catch(err => { throw err; });
}


module.exports.findOneCampaign = (id) => {
    return model.campaign.findOne({where: {id: id}, include: [{model: model.content}, {model: model.application}, {model: model.CampaignLocation}]})
        .then(campaign => { return campaign; })
        .catch(err => { throw err; });
}

module.exports.getOneBeaconCampaign = async (appId, major, minor) => {
    let beacon = await model.beacon_master.findOne({ where: { major: major, minor: minor } });
    let campaign = await model.campaign.findOne({ where: {applicationId: appId }, include:[{
        model: model.CampaignLocation,
        include: {model: model.location_master, where: { id: beacon.locationMasterId }}
    }] })
    if(campaign) {
        return campaign.id;
    } else {
        return null;
    }
}

// TODO Link geofences with Location Master
module.exports.getOneLocationCampaign = async (appId, lat, lng) => {
    let campaign = await model.campaign.findOne({ where: { applicationId: appId },order:[['createdAt', 'DESC']], include: { model: model.CampaignLocation, include: {model: model.location_master, include: model.geofence} } });
    let isInsideFence = geolib.isPointInCircle({latitude: lat, longitude: lng}, 
        {latitude: campaign.campaign_locations[0].location_master.geofences[0].latitude, longitude: campaign.campaign_locations[0].location_master.geofences[0].longitude},campaign.campaign_locations[0].location_master.geofences[0].radius);
    
    if(isInsideFence) {
        return campaign.id;
    } else {
        return null;
    }
    
}

module.exports.getOneWifiCampaign = async (appId, deviceId, wifis) => {

} 