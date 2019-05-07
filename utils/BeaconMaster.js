const db		= require('../db/postgres');
const model		= require('../models');
const Sequelize = require('sequelize');
const Op        = Sequelize.Op;


module.exports.addNewBeacon = (major, minor, uuid, shortlink, locationMasterId, public, userId) => {
    return model.beacon_master.create({ major: major, minor: minor, uuid: uuid, shortlink: shortlink, locationMasterId: locationMasterId, public: public, userId: userId })
        .then(beacon => { return beacon; })
        .catch(err => { throw err; });
}


module.exports.getAllBeacons = () => {
    return model.beacon_master.findAll({ include: [{model: model.location_master}]})
        .then(beacons => { return beacons })
        .catch(err => { throw err; });
}

module.exports.getAllUserBeacons = (userId) => {
    return model.beacon_master.findAll({ where: { userId: userId }, include: [{model: model.location_master}] })
        .then(beacons => { return beacons; })
        .catch(err => { throw err; });
}

module.exports.findOne = (id) => {
    return model.beacon_master.findOne({ where: {id: id}, include:[{model:model.location_master},{model:model.user, attributes: ['email']}, {model: model.tags}] })
        .then(beacon => { return JSON.parse(JSON.stringify(beacon)); })
        .catch(err => { throw err; });
}

module.exports.findOneAndUpdate = (id, major, minor, uuid, shortlink, locationMasterId) => {
    model.beacon_master.findByPk(id)
        .then( beacon => {
            beacon.update({ major: major, minor: minor, uuid: uuid, shortlink: shortlink, locationMasterId: locationMasterId });
        })
        .catch( err => { throw err; });
}

module.exports.getBeaconCampaign = async (major, minor, appId) => {
    let campaign = undefined;
    let beacon = await model.beacon_master.findOne({ where: { major: major, minor: minor }});
    let date = new Date()
    try {
        if(appId == 1) {
            campaign = await model.campaign.findOne({ 
                where: { 
                    applicationId: appId,
                    start_timestamp: {
                        [Op.lte]: date
                    },
                    end_timestamp: {
                        [Op.gte]: date
                    } 
                } 
            });
        } else {
            campaign = await model.campaign.findOne({ 
                where: { 
                    locationMasterId: beacon.locationMasterId, 
                    applicationId: appId,
                    start_timestamp: {
                        [Op.lte]: date
                    },
                    end_timestamp: {
                        [Op.gte]: date
                    } 
                } 
            });
        }
        
    } catch(err) {}
    // campaign = await model.campaign.findOne();
    return campaign;
}

module.exports.getAllBeaconData = async deviceId => {
    return await model.beacon.findAll({ where: { deviceId: deviceId } });
}