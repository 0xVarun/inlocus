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
 * Admin Dashboard
 * URL: /admin/home
 */
router.get('/', authMiddleware, async (req, res) => {
	let beacon = await Sensor.getLatestBeacon();
	let repeatVisitors = await model.beacon.count();
	let totalVisitors = repeatVisitors * 1.2;
	res.render('admin/home', { title: 'Admin', layout: 'home', beacon: beacon, repeatVisitors: repeatVisitors, total: totalVisitors });
});

router.get('/analytics', authMiddleware, (req, res) => {
	res.render('admin/comingsoon', { title: 'Admin', layout: 'home' });
});

/**
 * Graph Beacon
 */
router.get('/beacon/list', async(req, res) => {
	let data = await Sensor.countByHour();
	res.json(data);
});

/**
 * Create New Geo Fence
 * URL: /admin/home/geofence/create
 */
router.get('/geofence/create', authMiddleware, (req, res) => {
	res.render('admin/fence', { title: 'New Fence', layout: 'home' })
});

/**
 * Save Geo Fence Name POST
 * URL: /admin/home/geofence/create
 */
router.post('/geofence/create', authMiddleware, async (req, res) => {
	let name = req.body.fence;
	let user = req.user.id;
	let mGeofence = await GeoFence.create(name, user);
	console.log(mGeofence);
	if(!mGeofence.id) {
		res.redirect('/admin/home/geofence/create');
		return;
	}
	res.redirect(`/admin/home/fence/maps?id=${mGeofence.id}`)
});

/**
 * Renders Maps
 * URL: /admin/home/fence/maps
 */
router.get('/fence/maps', authMiddleware, (req, res) => {
	res.render('admin/geofence', { title: 'Geo Fence', layout: 'geofence' });
});

/**
 * Save All GeoFence POST
 * URL: /admin/home/geofence
 */
router.post('/geofence', authMiddleware, (req, res) => {
	let payload = req.body;
	console.log(payload);
	res.sendStatus(201);
});

/**
 * View All Admin and SuperAdmin Users
 * URL: /admin/home/users
 */
router.get('/users', suMiddleware, async (req, res) => {
	let Users = await User.findAll();
	console.log(JSON.stringify(Users));
	res.render('superadmin/users', { title: 'Admin', layout: 'home', adminuser: JSON.parse(Users) });
});

/**
 * View All Staff Users
 * URL: /admin/home/staffs
 */
router.get('/staffs', suMiddleware, async (req, res) => {
	let staffUsers = await User.findStaff();
	res.render('superadmin/staffs',  { title: 'Admin', layout: 'home', staffusers: JSON.parse(staffUsers) });
})

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
		let app = await Application.registerApplication(name, api_key, api_secret);
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
	let apps = await Application.findAll();
	res.render('superadmin/applications', { title: 'Admin', layout: 'home', application: apps });
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
	await LocationMaster.createLocations(locationName, type);
	res.redirect('/admin/home/location');
});

/**
 * Edit Location Master
 * URL: /admin/home/location/edit/:id
 */
router.get('/location/edit/:id', suMiddleware, async(req, res) => {
	let location = await LocationMaster.findOne(req.params.id);
	res.render('superadmin/locationedit', { title: 'Locations Master', layout: 'home', location: location });	
});

/**
 * Edit Location Master POST
 * URL: /admin/home/location/edit/:id
 */
router.post('/location/edit/:id', suMiddleware, async(req, res) => {
	await LocationMaster.findOneAndUpdate(req.params.id, req.body.name, req.body.type);
	res.redirect('/admin/home/locations')
});

/**
 * View All Location Masters
 * URL: /admin/home/locations
 */
router.get('/locations', suMiddleware, async(req, res) => {
	let locations = await LocationMaster.getAllLocations();
	res.render('superadmin/locations', { title: 'Locations Master', layout: 'home', locations: locations });
});

/**
 * Add New Beacon View
 * URL: /admin/home/beacon
 */
router.get('/beacon', suMiddleware, async(req, res) => {
	let locations = await LocationMaster.getAllLocations();
	res.render('superadmin/addbeacon', { title: 'Beacon Master', layout: 'home', locations: locations })
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
	await BeaconMaster.addNewBeacon(major, minor, uuid, shortlink, location);
	res.redirect('/admin/home/beacon');
});

/**
 * View All Beacons 
 * URL: /admin/home/beacons
 */
router.get('/beacons', suMiddleware, async(req, res) => {
	let beacons = await BeaconMaster.getAllBeacons();
	res.render('superadmin/beacons', { title: 'Beacon Master', layout: 'home', beacons: beacons })
});

/**
 * Edit Beacon
 * URL: /admin/home/beacon/:id
 */
router.get('/beacon/:id', suMiddleware, async(req, res) => {
	let beacon = await BeaconMaster.findOne(req.params.id);
	let locations = await LocationMaster.getAllLocations();
	res.render('superadmin/editbeacon', { title: 'Beacon Master', layout: 'home', beacon: beacon, locations: locations })
});

/**
 * Save Edit Beacon
 * URL: /admin/home/beacon/:id
 */
router.post('/beacon/:id', suMiddleware, async(req, res) => {
	let id = req.params.id;
	let major = req.body.major;
	let minor = req.body.minor;
	let shortlink = req.body.shortlink;
	let uuid = req.body.uuid;
	let location = req.body.location;
	await BeaconMaster.findOneAndUpdate(id, major, minor, uuid, shortlink, location);
	res.redirect('/admin/home/beacons');
})

module.exports = router;