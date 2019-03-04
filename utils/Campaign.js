const db		= require('../db/postgres');
const model		= require('../models');

module.exports.createCampaign = (payload) => {
    return model.campaign.create(payload)
        .then(campaign => { return campaign; })
        .catch(err => { throw err; })
}


module.exports.findAllCampaigns = (appId) => {
    return model.campaign.findAll({ where: { applicationId: appId }})
        .then(campaigns => { return campaigns; })
        .catch(err => { throw err; });
}