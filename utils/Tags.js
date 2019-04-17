const model		= require('../models');

module.exports.createBeaconTag = (tagList, beaconMasterId, userId) => {
    let tags = tagList.split(',');
    tags.map(async (tag) => {
        await model.tags.create({ tag: tag, beaconMasterId: beaconMasterId, userId: userId, type: 'beacon' });
    });
}

module.exports.createLocationTag = (tagList, locationMasterId, userId) => {
    let tags = tagList.split(',');
    tags.map(async (tag) => {
        await model.tags.create({ tag: tag, locationMasterId: locationMasterId, userId: userId, type: 'location'});
    });
}