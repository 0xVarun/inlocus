const model = require('../models');
const redis = require('../db/redis').redis;
const cache = require('../db/redis').cache;

function addToCache(id) {
    model.campaign.findOne({where: {id: id}, include: [{model: model.content}, {model: model.application}, {model: model.CampaignLocation, include: {model: model.location_master}}]})
        .then(campaign => {
            cache.set(id.toString(), JSON.parse(JSON.stringify(campaign)));  
        })
        .catch(err => { 
            throw err; 
        });
} 

async function checkIfId(deviceId) {
    let d = await redis.get(deviceId);

    if(d) {
        return false;
    } else {
        return true;
    }
}

async function getCampaign(id, deviceId) {
    let isAllowed = await checkIfId(deviceId);
    if(isAllowed) {
        let payload = await cache.get(id.toString());
        redis.set(deviceId, 1, 'ex', 10);
        return payload;
    } else {
        return null;
    }

}

module.exports.getCampaign = getCampaign;
module.exports.addToCache = addToCache;