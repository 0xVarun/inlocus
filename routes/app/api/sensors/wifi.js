const express 		= require('express');
const router		= express.Router();
const utils 		= require('../../../../utils');
const apiMiddleware = require('../../../../middleware/api').apiAuth;
const _				= require('lodash');
const CampaignMgmt	= require('../../../../campaign/cache');


/**
 * url /api/sensor/wifi
 * method PUT
 * header authorization: Bearer <TOKEN>
 * body ssid, bssid, rssi, freq, distance
 */ 
router.put('/', apiMiddleware, async (req, res) => {

	if(!req.is('application/json')){
		res.sendStatus(400);
		return;
	}	

	let payload = req.body;
	let deviceId = res.locals.user['deviceId'];

	let expected_keys = ["ssid", "bssid", "rssi", "freq", "distance"];
	let actual_keys = Object.keys(payload);

	if(!_.isEqual(expected_keys.concat().sort(), actual_keys.concat().sort())) {
		res.sendStatus(400);
		return;
	} else {
		let wifi = undefined;
		try {
			wifi = Senor.saveWifi(payload["bssid"], payload["ssid"], payload["rssi"], payload["distance"], payload["freq"], deviceId);
		} catch(err) {
			let er = err.name;
			er = er.replace(/Sequelize/gi, '');
			er = er.replace(/([A-Z])/g, ' $1').trim()
			res.status(400).send({ 'code': 400, 'message': er });
			return;
		}
	}

	res.status(201).send({'title': "", 'body': {}})
});

/**
 * url /api/sensor/wifi/multi
 * method PUT
 * header authorization: Bearer <TOKEN>
 * body [{ssid, bssid, rssi, freq, distance}]
 */ 
router.put('/multi', apiMiddleware, async (req, res) => {
	if(!req.is('application/json')){
		res.sendStatus(400);
		return;
	}
	
	if(!Array.isArray(req.body)) {
		res.sendStatus(400);
		return;
	}
	let deviceId = res.locals.user['deviceId'];
	let wifi = await utils.Sensor.saveMultiWifi(req.body, deviceId);

	let id = await utils.Campaign.getOneWifiCampaign(res.locals.user['appId'], req.body);
	
	let campaign =  undefined;
	
	if(id) {
		campaign = await CampaignMgmt.getCampaign(id, deviceId);
	}
	
	if(campaign) {
		let notif_payload = {
			"CampaignId": campaign.id,
			"NotificationTitle": campaign.title,
            "NotificationType": campaign.type,
            "Filters": campaign.filters,
            "Text_content": {
                "Offer_Text": campaign.body,
                "URI": campaign.action
            }
		}
		res.json(notif_payload);
		await utils.Notify.sent("SENT", deviceId, res.locals.user['appId'], campaign.id, "WIFI");
	} else {
		res.sendStatus(204);
	}

});

module.exports = router;