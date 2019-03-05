const db		= require('../db/postgres');
const model		= require('../models');


module.exports.addNewBeacon = (major, minor, uuid, shortlink, locationMasterId) => {
    return model.beacon_master.create({ major: major, minor: minor, uuid: uuid, shortlink: shortlink, locationMasterId: locationMasterId })
        .then(beacon => { return beacon; })
        .catch(err => { throw err; });
}


module.exports.getAllBeacons = () => {
    return model.beacon_master.findAll({ include: [{model: model.location_master}]})
        .then(beacons => { return beacons })
        .catch(err => { throw err; });
}

module.exports.findOne = (id) => {
    return model.beacon_master.findByPk(id)
        .then(beacon => { return beacon; })
        .catch(err => { throw err; });
}

module.exports.findOneAndUpdate = (id, major, minor, uuid, shortlink, locationMasterId) => {
    model.beacon_master.findByPk(id)
        .then( beacon => {
            beacon.update({ major: major, minor: minor, uuid: uuid, shortlink: shortlink, locationMasterId: locationMasterId });
        })
        .catch( err => { throw err; });
}