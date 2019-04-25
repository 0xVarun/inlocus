const db		= require('../db/postgres');
const model		= require('../models');

module.exports.createImageCampaign = async (name, title, start, end, body, action, content, app, locations, userId) => {
    let campaign = undefined;
    try {
        campaign = await model.campaign.create({ name:name, title: title, start_timestamp: start, end_timestamp: end, body: body, action: action, contentId: content, applicationId: app, type: 'IMAGE', userId: userId  });
        let id = campaign.id;
        locations.map(async location => {
            await model.CampaignLocation.create({campaignId: id, locationMasterId: location});
        });
        return campaign;
    } catch(err) {
        return err;
    }
}

module.exports.createTextCampaign = async (name, title, start, end, body, action, app, locations, userId) => {
    let campaign = undefined;
    try {
        campaign = await model.campaign.create({ name:name, title: title, start_timestamp: start, end_timestamp: end, body: body, action: action, contentId: null, applicationId: app, type: 'TEXT', userId: userId  });
        let id = campaign.id;
        locations.map(async location => {
            console.log(`map ${location}`);
            await model.CampaignLocation.create({campaignId: id, locationMasterId: location});
        });
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