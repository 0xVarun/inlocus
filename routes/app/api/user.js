const express 		= require('express');
const router 		= express.Router();
const User 			= require('../../../utils/SdkUser');
const _ 			= require('lodash');
const jwt			= require('jsonwebtoken');
const Application 	= require('../../../utils/Application');
const apiMiddleware = require('../../../middleware/api').apiAuth;

/**
 * Registering a new user for SDK
 * url - /api/user/register
 * method - POST
 * body - { userId, mobileNo, emailId }
 * returns - user id in db
 */
router.post('/register', async (req, res) => {
	
	if(!req.headers['authorization'] && req.headers['authorization'] !== process.env.AUTH_HEADER) {
		res.sendStatus(403);
		return;
	}

	if(!req.is('application/json')){
		res.sendStatus(400);
		return;
	}	

	let api_key = req.headers['x-app-api-key'];

	let application_id = undefined

	try {
		application_id = await Application.getAppId(api_key);
	} catch(err) {
		res.sendStatus(500);
		return;
	}


	let expected_keys = ['userId', 'mobileNo', 'emailId', 'deviceId'];
	let payload = req.body;
	let actual_keys = Object.keys(payload);
	// Validate all expected keys in json else return 400 bad request
	if(!_.isEqual(expected_keys.concat().sort(), actual_keys.concat().sort())) {
		res.sendStatus(400);
		return;
	} else {
		let appUser = undefined;
		try {
			appUser = await User.registerAppUser(payload['userId'], payload['mobileNo'], payload['emailId'], payload['deviceId'], application_id); 
		} catch(err) {
			let er = err.name;
			er = er.replace(/Sequelize/gi, '');
			er = er.replace(/([A-Z])/g, ' $1').trim()
			res.status(400).send({ 'code': 400, 'message': er });
			return;
		}
		if(!appUser.id) {
			res.sendStatus(500);
		}
		res.status(201).send({'appUserId': appUser['id']});
	}
	
});

/**
 * User Login .
 * url - /api/user/login
 * method - POST
 * body - { userId, deviceId } 
 */
router.post('/login', async (req, res) => {
	let userId = req.body.userId;
	let appUser = undefined;
	try {
		appUser = await User.getUserById(userId);
	} catch(err) {
		let er = err.name;
		er = er.replace(/Sequelize/gi, '');
		er = er.replace(/([A-Z])/g, ' $1').trim()
		res.status(400).send({ 'code': 400, 'message': er });
		return;
	}
	if(!appUser) {
		res.status(400).json({ message: 'Bad Request' });
		return;
	}

	let payload = { 
		id: appUser['id'],
		userId: appUser['userId'],
		mobileNo: appUser['mobileNo'],
		deviceId: appUser['deviceId'],
		appId: appUser['applicationId'],
		emailId: appUser['emailId']
	}
	let token = jwt.sign(payload, "jcwirrxNiX3iyMQ075xr5k8vC6hQbiSwc5JsvJbQCfsS1gdF+hg7/qNe9duZP5dclypByeqPE18AaoDI+Ghmmw==", { expiresIn: 60 * 60 * 24 * 365 });
	
	res.json({ token });
});

module.exports = router;
