const express 			= require('express');
const router			= express.Router();
const utils				= require('../../utils');
const authMiddleware	= require('../../middleware/auth');
const suMiddleware		= require('../../middleware/superadmin');
const model 			= require('../../models');

/**
 * @url: /admin/home
 * @member: GET
 * @template: views/admin/home
 * @desc: Admin Dashboard
 */
router.get('/', authMiddleware, async (req, res) => {
	let beacon = await utils.Sensor.getLatestBeacon();
	let repeatVisitors = await model.beacon.count();
	let totalVisitors = parseInt(repeatVisitors * 1.2);
	res.render('admin/home', { title: 'Admin', layout: 'base', beacon: beacon, repeatVisitors: repeatVisitors, total: totalVisitors });
});


/**
 * @url: /admin/analytics
 * @method: GET
 * @template: views/admin/comingsoon
 * @desc: App wise based analytics
 * 
 * @TODO: Implementation
 */
router.get('/analytics', authMiddleware, (req, res) => {
	res.render('admin/comingsoon', { title: 'Admin', layout: 'home' });
});

/**
 * Graph Beacon
 */
router.get('/beacon/list', async(req, res) => {
	let data = await utils.Sensor.countByHour();
	res.json(data);
});

/**
 * @url: /admin/home/users
 * @method: GET
 * @template: views/superadmin/usermanagement
 * @desc: Manage SuperUsers, Admin Users and Staff Users
 * 
 * @TODO: Add editing user roles and disabling login 
 */
router.get('/users', suMiddleware, async (req, res) => {
	let Users = await utils.User.findAll();
	let staffUsers = await utils.User.findStaff();
	res.render('superadmin/usermanagement', { title: 'Admin', layout: 'base', adminuser: JSON.parse(Users), staff: JSON.parse(staffUsers) });
});


/**
 * Create New App View
 * URL: /admin/home/app/new
 */
router.get('/app/new', suMiddleware, (req, res) => {
	res.render('superadmin/application', { title: 'Admin', layout: 'home' })
});

/**
 * Create New App POST
 * URL: /admin/home/app/new
 */
router.post('/app/new', suMiddleware, async (req, res) => {
	let name = req.body.app_name;
	let api_key = req.body.api_key;
	let api_secret = req.body.api_secret;
	try {
		let app = await utils.Application.registerApplication(name, api_key, api_secret);
	} catch (err) {
		res.redirect('/admin/home/app/new');
		return;
	}
	res.redirect('/admin/home/apps');
});

/**
 * List All Apps
 * URL: /admin/home/apps
 */
router.get('/apps', suMiddleware, async (req, res) => {
	let apps = await utils.Application.findAll();
	res.render('superadmin/apps', { title: 'Admin', layout: 'base', application: apps });
});

/**
 * Create New Location Master View
 * URL: /admin/home/location
 */
router.get('/location', suMiddleware, (req, res) => {
	res.render('superadmin/location', { title: 'Location Master', layout: 'home' });
});

/**
 * Create New Location Master POST
 * URL: /admin/home/location
 */
router.post('/location', suMiddleware, async(req, res) => {
	let locationName = req.body.locationname;
	let type = req.body.type;
	await utils.LocationMaster.createLocations(locationName, type);
	res.redirect('/admin/home/location');
});

/**
 * Edit Location Master
 * URL: /admin/home/location/:id
 */
router.get('/location/:id', suMiddleware, async(req, res) => {
	let location = await utils.LocationMaster.findOne(req.params.id);
	// let tags = location.tags;
	// let mTags = [];
	// tags.map(tag => {mTags.push({ 'value': tag.tag, 'text': tag.tag });});
	
	res.render('superadmin/locationedit', { title: 'Locations Master', layout: 'base', location: location });	
});

/**
 * Edit Location Master POST
 * URL: /admin/home/location/:id
 */
router.post('/location/:id', suMiddleware, async(req, res) => {
	await utils.LocationMaster.findOneAndUpdate(req.params.id, req.body.name, req.body.type);
	res.redirect('/admin/home/locations')
});

/**
 * View All Location Masters
 * URL: /admin/home/locations
 */
router.get('/locations', suMiddleware, async(req, res) => {
	let locations = await utils.LocationMaster.getAllLocations();
	res.render('superadmin/managelocation', { title: 'Locations Master', layout: 'base', locations: locations });
});

/**
 * Add New Beacon View
 * URL: /admin/home/beacon
 */
router.get('/beacon', suMiddleware, async(req, res) => {
	let locations = await utils.LocationMaster.getAllLocations();
	res.render('superadmin/newbeacon', { title: 'Beacon Master', layout: 'base', locations: locations })
});

/**
 * Add New Beacon POST
 * URL: /admin/home/beacon
 */
router.post('/beacon', suMiddleware, async(req, res) => {
	let major = req.body.major;
	let minor = req.body.minor;
	let shortlink = req.body.shortlink;
	let uuid = req.body.uuid;
	let location = req.body.location;
	let ctags = req.body.ctags
	let pretags = req.body.pretags
	// await BeaconMaster.addNewBeacon(major, minor, uuid, shortlink, location);
	// console.log({major,minor,shortlink,uuid,location,ctags,pretags});
	res.redirect('/admin/home/beacon');
});

/**
 * @url: /admin/home/beacons
 * @method: GET
 * @template: views/superadmin/managebeacon 
 * @desc: View all beacons in a datatable
 */
router.get('/beacons', suMiddleware, async(req, res) => {
	let beacons = await utils.BeaconMaster.getAllBeacons();
	res.render('superadmin/managebeacon', { title: 'Beacon Master', layout: 'base', beacons: beacons })
});


/**
 * @url: /admin/home/beacon/:id
 * @method: GET
 * @template: views/superadmin/beacon
 * @desc: Edit beacon
 * 
 */
router.get('/beacon/:id', suMiddleware, async(req, res) => {
	let beacon = await utils.BeaconMaster.findOne(req.params.id);
	let locations = await utils.LocationMaster.getAllLocations();
	res.render('superadmin/beacon', { title: 'Beacon Master', layout: 'base', beacon: beacon, locations: locations })
});


/**
 * @url: /admin/home/beacon/:id
 * @method: POST
 * @desc: Save beacon edits
 * 
 */
router.post('/beacon/:id', suMiddleware, async(req, res) => {
	let id = req.params.id;
	let major = req.body.major;
	let minor = req.body.minor;
	let shortlink = req.body.shortlink;
	let uuid = req.body.uuid;
	let location = req.body.location;
	await utils.BeaconMaster.findOneAndUpdate(id, major, minor, uuid, shortlink, location);
	res.redirect('/admin/home/beacons');
})

module.exports = router;