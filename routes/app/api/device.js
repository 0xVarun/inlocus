const express 		= require('express');
const router		= express.Router();
const Device 		= require('../../../utils/Device');
const passport		= require('passport');
const LocalStrategy	= require('passport-local').Strategy;
const _ 			= require('lodash');

/**
 * Register new device only via APIs
 * url - /api/device/register
 * method - POST
 * body - { IMEI, GAID, deviceId }
 * returns - device id in db
 */
router.post('/register', async (req, res) => {
	if(!req.is('application/json')) {
		res.sendStatus(400);
		return;
	} else {
		let expected_keys = ['IMEI', 'GAID', 'deviceId']
		let payload = req.body;
		let actual_keys = Object.keys(payload);
		// vaildate all expected keys in json
		if(!_.isEqual(expected_keys.concat().sort(), actual_keys.concat().sort())) {
			res.sendStatus(400);
			return;
		} else {
			let device = undefined;
			try {
				device = await Device.registerDevice(payload['IMEI'], payload['GAID'], payload['deviceId']);
			} catch (err) {
				console.log(err);
				let er = err.name;
				er = er.replace(/Sequelize/gi, '');
				er = er.replace(/([A-Z])/g, ' $1').trim()
				res.status(400).send({ 'code': 400, 'message': er });
				return;
			}
			if(!device.id) {
				res.sendStatus(500);
			}
			res.status(201).send({'id': device['id'], 'deviceId': device['deviceId']});
		}
	}
});

/**
 * API to fetch all devices
 * url - /api/device
 * method - GET
 * returns - [{device}]
 */
router.get('/', async (req, res) => {
	let devices = undefined;
	try {
		devices = await Device.findAllDevices(); 
	} catch (err) {
		res.sendStatus(500);
		return;
	}
	res.status(200).send(devices);
});



module.exports = router;
