const model		= require('../models');

module.exports.createBeaconTag = (tagList, beaconMasterId) => {
    let tags = tagList.split(',');
    tags.map(async (tag) => {
        await model.tags.create({ tag: tag, beaconMasterId: beaconMasterId });
    });
}

module.exports.createLocationTag = (tagList, locationMasterId) => {
    let tags = tagList.split(',');
    tags.map(async (tag) => {
        await model.ltags.create({ tag: tag, locationMasterId: locationMasterId});
    });
}

module.exports.getAllTags = async (id) => {
    let all = await model.ltags.findAll({ where: { locationMasterId: id }});
    if(!all) {
        return null;
    }
    let tags = [];
    all.map(tag => {
        tags.push(tag.tag);
    });
    return tags.join(',');
}