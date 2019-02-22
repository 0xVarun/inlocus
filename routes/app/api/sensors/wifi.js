const express 	= require('express');
const router	= express.Router();
const Sensor 	= require('../../../../utils/Sensor');
const apiMiddleware = require('../../../../middleware/api').apiAuth;
const _				= require('lodash');

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

module.exports = router;