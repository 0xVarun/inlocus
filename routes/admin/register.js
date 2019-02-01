const express 		= require('express');
const router		= express.Router();
const passport		= require('passport');
const LocalStrategy	= require('passport-local').Strategy;
const User 			= require('../../utils/User');
const _ 			= require('lodash');

/**
 * Register Users only via API call
 * url - /admin/register
 * method - POST
 * body - { name, username, email, password }
 * returns - admin id in db
 */
router.post('/',async (req, res) => {

	// check for valid authorization headers
	if( !req.headers['authorization'] && req.headers['authorization'] !== process.env.AUTH_HEADER) {
		res.sendStatus(403);
		return;
	}

	// check valid content type
	if(!req.is('application/json')) {
		res.sendStatus(400);
		return;
	} else {
		let expected_keys = ['name', 'username', 'email', 'password']
		let payload = req.body;
		let actual_keys = Object.keys(payload);
		// vaildate all expected keys in json
		if(!_.isEqual(expected_keys.concat().sort(), actual_keys.concat().sort())) {
			res.sendStatus(400);
			return;
		} else {
			let u = undefined;
			try {
				u = await User.registerUser(payload['name'], payload['username'], payload['email'], payload['password']);
			} catch(err) {
				res.send(400);
				return;
			}
			if(!u.id) {
				res.sendStatus(500);
			}
			res.status(201).send({'userId': u['id']});
		}
	}
});

module.exports = router;