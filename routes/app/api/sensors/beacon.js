const express 		= require('express');
const router		= express.Router();
const utils 		= require('../../../../utils');
const apiMiddleware = require('../../../../middleware/api').apiAuth;
const _				= require('lodash');
const CampaignMgmt	= require('../../../../campaign/cache');

/**
 * @url: /api/sensor/beacon
 * @method: PUT
 * @header: authorization: Bearer <TOKEN>
 * @body: { uuid, major, minor, rssi, distance } 
 * @desc: Takes beacon information from device and sends
 * 	campaign to the device if available 
 * 
 * @todo: Create notification payload based on campaign
 * 	type
 */ 
router.put('/', apiMiddleware, async (req, res) => {

	if(!req.is('application/json')){
		res.sendStatus(400);
		return;
	}	

	let payload = req.body;
	let deviceId = res.locals.user['deviceId'];

	let expected_keys = ["uuid", "major", "minor", "rssi", "distance"];
	let actual_keys = Object.keys(payload);

	if(!_.isEqual(expected_keys.concat().sort(), actual_keys.concat().sort())) {
		res.sendStatus(400);
		return;
	} else {
		let beacon = undefined;
		let location = undefined;
		try {
			beacon = await utils.Sensor.saveBeacon(payload["major"], payload["minor"], payload["uuid"], payload["rssi"], payload["distance"], deviceId);
		} catch (err) {
			let er = err.name;
			er = er.replace(/Sequelize/gi, '');
			er = er.replace(/([A-Z])/g, ' $1').trim()
			res.status(400).send({ 'code': 400, 'message': er });
			return;
		}
	}
	
	let id = await utils.Campaign.getOneBeaconCampaign(res.locals.user['appId'], payload['major'], payload['minor'])
	
	let campaign =  undefined;
	
	if(id) {
		campaign = await CampaignMgmt.getCampaign(id, deviceId);
	}
	
	if(campaign) {
		let notif_payload = {
			"NotificationTitle": campaign.title,
            "NotificationType": campaign.type,
            "Text_content": {
                "Offer_Text": campaign.body,
                "URI": campaign.action
            }
		}
		res.json(notif_payload);
	} else {
		res.sendStatus(204);
	}
});

module.exports = router;