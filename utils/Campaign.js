const db		= require('../db/postgres');
const model		= require('../models');

module.exports.createImageCampaign = async (name, title, start, end, body, action, content, app, locations) => {
    let campaign = undefined;
    try {
        campaign = await model.campaign.create({ name:name, title: title, start_timestamp: start, end_timestamp: end, body: body, action: action, content: content, applicationId: app, type: 'IMAGE'  });
    } catch(err) {

    }
}

module.exports.findAllCampaigns = (appId) => {
    return model.campaign.findAll({ where: { applicationId: appId }})
        .then(campaigns => { return campaigns; })
        .catch(err => { throw err; });
}