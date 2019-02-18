const express 			= require('express');
const router			= express.Router();
const User				= require('../../utils/User');
const Application 		= require('../../utils/Application');
const authMiddleware	= require('../../middleware/auth');
const suMiddleware		= require('../../middleware/superadmin');


router.get('/', authMiddleware, (req, res) => {
	res.render('admin/home', { title: 'Admin', layout: 'home' });
});

router.get('/fence', authMiddleware, (req, res) => {
	res.render('admin/geofence', { title: 'Geo Fence', layout: 'home' });
})

router.get('/users', suMiddleware, async (req, res) => {
	let Users = await User.getAll();
	res.render('superadmin/users', { title: 'Admin', layout: 'home', adminuser: JSON.parse(Users) });
});

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