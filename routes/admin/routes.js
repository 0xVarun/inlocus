const express 	= require('express');
const router	= express.Router();

const login		    = require('./login');
const register	    = require('./register');
const admin		    = require('./admin');
const campaigns	    = require('./campaigns');
const helpers	    = require('./helpers');
const user		    = require('./user');
const staff		    = require('./staff');
const appAdmin      = require('./app');
const appBeacon     = require('./beacon');
const content       = require('./content');
const fence         = require('./geofence');
const location      = require('./location');

router.use('/login', login);
router.use('/register', register);
router.use('/home', admin);
router.use('/api', helpers);
router.use('/campaigns', campaigns);
router.use('/user', user);
router.use('/staff', staff);
router.use('/app', appAdmin);
router.use('/beacon', appBeacon);
router.use('/content', content);
router.use('/geofence', fence);
router.use('/location', location);
router.use('/', (req, res) => { res.redirect('/admin/login'); })

module.exports = router;