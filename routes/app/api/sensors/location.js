const express 		= require('express');
const router		= express.Router();
const utils 		= require('../../../../utils');
const apiMiddleware = require('../../../../middleware/api').apiAuth;
const _				= require('lodash');
const Cache			= require('../../../../campaign/cache').getCampaign;

/**
 * @url: /api/sensor/location
 * @method: PUT
 * @header: authorization: Bearer <TOKEN>
 * @body: { latitude, longitude } 
 * @desc: Takes location information from device and sends
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

	let expected_keys = ["latitude", "longitude"];
	let actual_keys = Object.keys(payload);

	if(!_.isEqual(expected_keys.concat().sort(), actual_keys.concat().sort())) {
		res.sendStatus(400);
		return;
	} else {
		let location = undefined;
		try {
			location = await utils.Sensor.saveLocation(payload["latitude"], payload["longitude"], deviceId);
		} catch(err) {
			let er = err.name;
			er = er.replace(/Sequelize/gi, '');
			er = er.replace(/([A-Z])/g, ' $1').trim()
			res.status(400).send({ 'code': 400, 'message': er });
			return;
		}
	}

	let id = await utils.Campaign.getOneLocationCampaign(res.locals.user['appId'], payload['latitude'], payload['longitude']);

	if(id) {
		let campaign = await Cache(id, deviceId);
		if(campaign) {
			let notif_payload = {
				"CampaignId": campaign.id,
				"NotificationTitle": campaign.title,
				"NotificationType": campaign.type,
				"Text_content": {
					"Offer_Text": campaign.body,
					"URI": campaign.action
				}
			}
			res.json(notif_payload);
		} else {
			res.sendStatus(204)
		}
	} else {
		res.sendStatus(204);
	}
	
});

module.exports = router;