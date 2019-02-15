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
				return;
			}
			res.status(201).send({'userId': u['id']});
		}
	}
});

router.post('/r', async (req, res) => {
	// let username = req.body.username;
	// let email = req.body.email;
	// let name = req.body.name;
	// let password = req.body.password;
	// let password2 = req.body.password2;

	// req.checkBody('password2', 'Passwords do not match').equals(password);
	// let errors = req.validationErrors();

	// if(errors) {
	// 	req.flash('error_msg', 'Passwords do not match');
	// 	res.redirect('/admin/login/register');
	// 	console.log('here');
	// } else {
	// 	let new_adminuser = undefined;
	// 	try {
	// 		new_adminuser = await User.registerUser(name, username, email, password);
	// 	} catch(err) {
	// 		console.log(err.errors[0].message);
	// 		let er = err.errors[0].message;
	// 		er = er.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
	// 		req.flash('error_msg', er);
	// 		res.redirect('/admin/login/register');
	// 		return;
	// 	}
	// 	if(!new_adminuser.id) {
	// 		req.flash('error_msg', 'Unable to register user');
	// 		res.redirect('/admin/login/register')
	// 	} else {
	// 		req.flash('success_msg', 'User registered');
	// 		res.redirect('/admin/login');
	// 	}
	// }
	req.flash('error_msg', 'Please contact us via mail');
	res.redirect('/admin/login');
});

module.exports = router;