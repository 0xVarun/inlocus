const db		= require('../db/postgres');
const model		= require('../models');

module.exports.clicked = async (status, deviceId, appId, campaignId, type) => {

    let existing = await model.notify.findOne({ where: { deviceId: deviceId, campaignId: campaignId, applicationId: appId , type: type} });

    if(existing) {
        model.notify.findOne({
            where: { deviceId: deviceId, campaignId: campaignId, applicationId: appId, type: type },
            order: [['createdAt', 'DESC']]
        }).then(notify => {
            notify.update({ status: status });
        })
    } else {
        await model.notify.create({ status: status, deviceId: deviceId, applicationId: appId, campaignId: campaignId, type: type });
    }    
}

module.exports.sent = async (status, deviceId, appId, campaignId, type) => {
    await model.notify.create({ status: status, deviceId: deviceId, applicationId: appId, campaignId: campaignId, type: type });
}