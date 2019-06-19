const model		= require('../models');
const Op        = require('sequelize').Op;

module.exports.clicked = async (notificationId) => {
    let existing = await model.notify.findByPk(notificationId);
    if(existing) {
        model.notify.findByPk(notificationId)
            .then(notif => { notif.update({ fstatus: 'CLICKED' }) });
    }
}

module.exports.sent = async (status, deviceId, appId, campaignId, type) => {
    let clicked = await model.notify.create({ istatus: status, deviceId: deviceId, applicationId: appId, campaignId: campaignId, type: type });
    return clicked;
}