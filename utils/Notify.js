const model		= require('../models');
const Op        = require('sequelize').Op;

module.exports.clicked = async (status, deviceId, appId, campaignId, type) => {

    let existing = await model.notify.findOne(
        { 
            where: { 
                deviceId: {
                    [Op.eq]:deviceId
                }, 
                campaignId: {
                    [Op.eq]:campaignId
                }, 
                applicationId: {
                    [Op.eq]:appId
                } , 
                type: {
                    [Op.eq]:type
                }
            } 
        });

    if(existing) {
        model.notify.findOne(
            {
                where: { 
                    deviceId: {
                        [Op.eq]: deviceId
                    }, 
                    campaignId: {
                        [Op.eq]: campaignId
                    }, 
                    applicationId: {
                        [Op.eq]: appId
                    }, 
                    type: {
                        [Op.eq]: type
                    } 
                },
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