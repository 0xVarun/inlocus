const model		= require('../models');

module.exports.createTag = (tagList, beaconMasterId) => {
    let tags = tagList.split(',');
    tags.map(async (tag) => {
        await model.tags.create({ tag: tag, beaconMasterId: beaconMasterId });
    });
}