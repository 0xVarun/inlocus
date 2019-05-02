const db		= require('../db/postgres');
const model		= require('../models');

module.exports.clicked = async (status, deviceId, appId, campaignId) => {

    let existing = await model.notify.findOne({ where: { deviceId: deviceId, campaignId: campaignId, applicationId: appId } });

    if(existing) {
        model.notify.findOne({
            where: { deviceId: deviceId, campaignId: campaignId, applicationId: appId },
            order: [['createdAt', 'DESC']]
        }).then(notify => {
            notify.update({ status: status });
        })
    } else {
        await model.notify.create({ status: status, deviceId: deviceId, applicationId: appId, campaignId: campaignId });
    }    
}

module.exports.sent = async (status, deviceId, appId, campaignId) => {
    await model.notify.create({ status: status, deviceId: deviceId, applicationId: appId, campaignId: campaignId });
}