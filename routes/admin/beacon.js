const express 			= require('express');
const router			= express.Router();
const User				= require('../../utils/User');
const Application		= require('../../utils/Application');
const GeoFence 			= require('../../utils/GeoFence');
const LocationMaster	= require('../../utils/LocationMaster');
const Sensor			= require('../../utils/Sensor');
const BeaconMaster		= require('../../utils/BeaconMaster');
const authMiddleware	= require('../../middleware/auth');
const suMiddleware		= require('../../middleware/superadmin');
const model 			= require('../../models');


/**
 * @url: /admin/beacon
 * @method: GET
 * @view: views/admin/adminbeacons.handlebars
 * @desc: View all beacons added by the admin user
 */
router.get('/', authMiddleware, async (req, res) => {
	res.render('admin/adminbeacons', { title: 'Admin', layout: 'base'});
});


/**
 * @url: /admin/beacon/create
 * @method: GET
 * @view: views/admin/adminbeacon.handlebars
 * @desc: Add new Beacon
 */
router.get('/create', authMiddleware, async (req, res) => {
	res.render('admin/adminbeacon', { title: 'Admin', layout: 'base'});
});


/**
 * @url: /admin/beacon/create
 * @method: POST
 * @desc: Insert new Beacon into database
 * 
 * @TODO: adding beacon to beacon master or create new table
 */
router.post('/create', authMiddleware, async(req, res) => {

})

module.exports = router;