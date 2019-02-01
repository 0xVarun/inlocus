const express 	= require('express');
const router 	= express.Router();
const User 		= require('../../utils/SdkUser');
const _ 		= require('lodash');

/**
 * Registering a new user for SDK
 * url - /api/user/register
 * method - POST
 * body - { userId, mobileNo, emailId }
 * returns - user id in db
 */
router.post('/register', (req, res) => {

});