const express 	= require('express');
const router 	= express.Router();
const User 		= require('../../../utils/SdkUser');
const _ 		= require('lodash');

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
			appUser = await User.registerAppUser(payload['userId'], payload['mobileNo'], payload['emailId'], payload['deviceId']); 
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


module.exports = router;
