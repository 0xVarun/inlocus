const express 	= require('express');
const router	= express.Router();

// const login		= require('./login');
const api_register	= require('./api/device');
const api_user		= require('./api/user');
const sensor		= require('./api/sensors/routes');

// router.use('/login', login);
router.use('/api/device', api_register);
router.use('/api/user', api_user);
router.use('/api/sensor', sensor);
router.get('/', (req, res) => { res.redirect('/admin') })

module.exports = router;