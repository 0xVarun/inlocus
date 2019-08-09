const model		    = require('../models');
const CampaignMgnt  = require('../campaign/cache');
const geolib        = require('geolib');
const Op            = require('sequelize').Op;
const Sequelize     = require('sequelize');

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
        campaign = await model.campaign.create({ name:name, title: title, start_timestamp: start, end_timestamp: end, body: body, action: action, contentId: content, applicationId: app, type: 'IMAGE', userId: userId, filters: filters  });
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
        campaign = await model.campaign.create({ name:name, title: title, start_timestamp: start, end_timestamp: end, body: body, action: action, contentId: null, applicationId: app, type: 'TEXT', userId: userId, filters: filters });
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
    console.log(`MAJOR: ${major}, MINOR: ${minor}`);
    let beacon = await model.beacon_master.findOne({ where: { major: major, minor: minor } });
    
    // If Not such beacon in database Maybe add to list with google address location
    if(!beacon) {
        // Return null if no beacon in db.
        return null;
    }

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

module.exports.getOneLocationCampaign = async (appId, lat, lng, location) => {
    let locations = await model.sequelize.query(`select geofences."locationMasterId" 
		from locations, geofences 
		where ST_Within(locations.geometry, geofences.geometry) 
		and locations.id = ${location.id}`, 
		{ type: Sequelize.QueryTypes.SELECT}
    )

    if(locations.length === 0) {
        return null;
    }

    let campaign = await model.campaign.findOne(
        { 
            where: { 
                applicationId: {
                    [Op.eq]: appId
                } 
            },
            include: { 
                model: model.CampaignLocation,
                where: {
                    locationMasterId: {
                        [Op.eq]: locations[0]["locationMasterId"]
                    }
                }
            }
        }
    );

    
    if(campaign) {
        return campaign.id;
    } else {
        return null;
    }
    
}

module.exports.getOneWifiCampaign = async (appId, wifis) => {
    // [{ssid, bssid, rssi, freq, distance}]
    console.log('------');
    console.log(wifis);
    console.log('------');
    let bssids = [];
    try {
        wifis.map(wifi => {
            bssids.push({ bssid: wifi.bssid })
        })
    } catch(err) {
        // Return null if unable to created bssid SQL string
        return null;
    }

    let locationMaster = await model.WifiMaster.findAll({
        where: {
            [Op.or]: bssids
        },
        attributes:['locationMasterId'],
        group: 'locationMasterId'
    });

    
    if(!locationMaster) {
        // Return null if no locationMasterId
        return null
    }

    for(let i = 0; i < locationMaster.length; i++) {
        let campaign = await model.campaign.findOne({
            where: {
                applicationId: {
                    [Op.eq]: appId
                }
            },
            order: [['createdAt', 'DESC']],
            include: [
                { 
                    model: model.CampaignLocation, 
                    where: { 
                        locationMasterId: { 
                            [Op.eq]: locationMaster[i]['locationMasterId'] 
                        } 
                    } 
                }
            ]
        });

        if(campaign) {
            // If Campagin is Found return the function with the campaign id
            return campaign.id;
        }
    }

    return null;

} 