const model = require('../models');
const Op    = require('sequelize').Op;

function makeCampaignPayload(campaign) {
    if(campaign.file) {
        let payload = {
            "NotificationTitle": campaign.name,
            "NotificationType": "Text",
            "Text_content": {
                "Offer_Text": campaign.content,
                "URI": campaign.action
            }
        }
        return payload;
    } else {
        let payload = {
            "NotificationTitle": campaign.name,
            "NotificationType": "Text",
            "Text_content": {
                "Offer_Text": campaign.content,
                "URI": campaign.action
            }
        }
        return payload;
    }
}

async function getBeaconCampaign(payload) {
    let date = new Date();
    let beacon = await model.beacon_master.findOne({ where: { major: payload.major, minor: payload.minor }});
    if(beacon) {
        let campaign = await model.campaign.findOne({
            where: { 
                locationMasterId: beacon.locationMasterId, 
                applicationId: payload.appId,
                start_timestamp: {
                    [Op.lte]: date
                },
                end_timestamp: {
                    [Op.gte]: date
                } 
            }
        });
        return makeCampaignPayload(campaign);
    } else {
        return null;
    }
}

async function getWifiCampaign(payload) {
    
}

async function getLocationCampaign(payload) {
    
}


async function getCampaign(payload, type) {
    if(type === 'wifi') {
        return await getWifiCampaign(payload);
    } else if(type === 'beacon') {
        return await getBeaconCampaign(payload);
    } else if(type === 'location') {
        return await getLocationCampaign(payload);
    } else {
        return null;
    }
}

module.exports = getCampaign