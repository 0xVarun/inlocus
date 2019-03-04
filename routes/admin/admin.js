const express 			= require('express');
const router			= express.Router();
const User				= require('../../utils/User');
const Application		= require('../../utils/Application');
const GeoFence 			= require('../../utils/GeoFence');
const LocationMaster	= require('../../utils/LocationMaster');
const authMiddleware	= require('../../middleware/auth');
const suMiddleware		= require('../../middleware/superadmin');

/**
 * Admin Dashboard
 * URL: /admin/home
 */
router.get('/', authMiddleware, (req, res) => {
	res.render('admin/home', { title: 'Admin', layout: 'home' });
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
})

/**
 * View All Location Masters
 * URL: /admin/home/locations
 */
router.get('/locations', suMiddleware, async(req, res) => {
	let locations = await LocationMaster.getAllLocations();
	res.render('superadmin/locations', { title: 'Locations Master', layout: 'home', locations: locations });
})

module.exports = router;