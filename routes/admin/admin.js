const express 			= require('express');
const router			= express.Router();
const GeoFence 			= require('../../utils/GeoFence');
const authMiddleware	= require('../../middleware/auth');
const suMiddleware		= require('../../middleware/superadmin');

router.get('/', authMiddleware, (req, res) => {
	res.render('admin/home', { title: 'Admin', layout: 'home' });
});

/**
 * Create New Geo Fence
 */
router.get('/geofence/create', authMiddleware, (req, res) => {
	res.render('admin/fence', { title: 'New Fence', layout: 'home' })
});

/**
 * Save Geo Fence Name
 */
router.post('/geofence/create', authMiddleware, (req, res) => {
	let name = req.body.fence;
	let user = req.user.id;
	let mGeofence = GeoFence.create(name, user);
	if(!mGeofence.id) {
		res.redirect('/admin/home/geofence/create');
		return;
	}
	res.redirect(`/admin/home/fence/maps?id=${mGeofence.id}`)
});

/**
 * Renders Maps
 */
router.get('/fence/maps', authMiddleware, (req, res) => {
	res.render('admin/geofence', { title: 'Geo Fence', layout: 'geofence' });
});

/**
 * Save All GeoFence
 */
router.post('/geofence', authMiddleware, (req, res) => {
	let payload = req.body;
	console.log(payload);
	res.sendStatus(201);
});

/**
 * View All Admin and SuperAdmin Users
 */
router.get('/users', suMiddleware, async (req, res) => {
	let Users = await User.findAll();
	console.log(JSON.stringify(Users));
	res.render('superadmin/users', { title: 'Admin', layout: 'home', adminuser: JSON.parse(Users) });
});

router.get('/staffs', suMiddleware, async (req, res) => {
	let staffUsers = await User.findStaff();
	res.render('superadmin/staffs',  { title: 'Admin', layout: 'home', staffusers: JSON.parse(staffUsers) });
})

router.get('/app/new', suMiddleware, (req, res) => {
	res.render('superadmin/application', { title: 'Admin', layout: 'home' })
});

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

router.get('/apps', suMiddleware, async (req, res) => {
	let apps = await Application.findAll();
	res.render('superadmin/applications', { title: 'Admin', layout: 'home', application: apps });
})

module.exports = router;