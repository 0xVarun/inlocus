const express 			= require('express');
const router			= express.Router();
const utils				= require('../../utils');
const authMiddleware	= require('../../middleware/auth');
const suMiddleware		= require('../../middleware/superadmin');
const model 			= require('../../models');
const formidable        = require('formidable');
const fs                = require('fs');
const path              = require('path');


/**
 * @url: /admin/home
 * @member: GET
 * @template: views/admin/home
 * @desc: Admin Dashboard
 */
router.get('/', authMiddleware, async (req, res) => {
	let beacon = await utils.Sensor.getLatestLocation(req.user.id);
	let deviceCount = await utils.Sensor.getTotalDevices(req.user.id);
	let repeatVisitors = 0;
	if(deviceCount != 0) {
		repeatVisitors = await model.location.count();
	}
	let totalVisitors = parseInt(repeatVisitors * 1.2);
	let apps = await utils.SdkUser.getUsers(req.user.id);
	res.render('admin/home', { title: 'Admin', layout: 'base', beacon: beacon, repeatVisitors: repeatVisitors, total: totalVisitors, apps: apps });
});


/**
 * @url: /admin/home/graph
 * @method: GET
 * @desc: JSON data for graph of users seen daywise
 */
router.get('/graph', async(req, res) => {
	let data = await utils.Sensor.countByHour(req.user.id);
	res.json(data);
});


router.get('/pie', async(req, res) => {
	let data = await utils.Sensor.getDeviceCount(req.user.id);
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
 * @url: /admin/home/:id/sdk
 * @method: GET
 * @template: views/superadmin/usersdk
 * @desc: Upload personalized SDK for each User
 */
router.get('/:id/sdk', suMiddleware, async(req, res) => {
	res.render('superadmin/usersdk', { title: 'Admin', layout: 'base', tid: req.params.id });
});


/**
 * @url: /admin/home/:id/sdk
 * @method: POST
 * @desc: Upload personalized SDK for each User
 */
router.post('/:id/sdk', suMiddleware, async(req, res) => {
	let form = new formidable.IncomingForm();
    form.multiples = false;
    form.uploadDir = process.env.NODE_UPLOAD_DIR;
    form.parse(req, async (err, fields, files) => {
        if(err) { res.redirect(`/admin/home/${req.params.id}/sdk`); return; }
        if(files.content.size < 1) { res.redirect(`/admin/home/${req.params.id}/sdk`); return; }
        if(files.content.type !== 'application/zip') { res.redirect(`/admin/home/${req.params.id}/sdk`); return; }
        let name = files.content.name.split('.')[0];
        let ext = files.content.name.split('.')[1];
        fs.renameSync(files.content.path, path.join(form.uploadDir, `${name}-${req.params.id}.${ext}`));
        await utils.SDK.uploadSDK(`/uploads/${name}-${req.params.id}.${ext}`, req.params.id);
      	res.redirect(`/admin/home/${req.params.id}/sdk`);
    });
});


/**
 * @url: /admin/home/users/add
 * @method: GET
 * @template: views/superadmin/user
 * @desc: Create SuperUsers, Admin Users and Staff Users
 * 
 */
router.get('/users/add', suMiddleware, async (req, res) => {
	res.render('superadmin/user', { title: 'Admin', layout: 'base' });
});


/**
 * @url: /admin/home/users/add
 * @method: POST
 * @desc: Create SuperUsers, Admin Users and Staff Users
 * 
 */
router.post('/users/add', suMiddleware, async (req, res) => {
	let username = req.body.username;
	let email = req.body.email;
	let password = req.body.password;
	let rpassword = req.body.rpassword;
	let name = req.body.name;
	let roles = req.body.roles;

	if(roles === '0') {
		// Superadmin
		await utils.User.registerSuperadminUser(name, username, email, password);
	} else if(roles === '1') {
		// AppAdmin
		await utils.User.registerUser(name, username, email, password);
	}else if(roles === '2') {
		// AppStaff
		await utils.User.registerStaffUser(name, username, email, password);
	} else {
		// Advertiser
		await utils.User.registerAdvertiserUser(name, username, email, password);
	}

	res.redirect('/admin/home/users/add');
});


/**
 * @url: /admin/home/users/edit/id
 * @method: GET
 * @template: views/superadmin/apps.handlebars
 * @desc: List View of all Applications
 */
router.get('/users/edit/:id', suMiddleware, async (req, res) => {
	let userId = req.params.id;
	let appUser = await utils.User.getUserByUserId(userId);
	console.log(JSON.parse(JSON.stringify(appUser)));
	res.render('superadmin/useredit', { title: 'Admin', layout: 'base', appUser: appUser });
});


/**
 * @url: /admin/home/users/del/id
 * @method: GET
 * @template: views/superadmin/apps.handlebars
 * @desc: List View of all Applications
 */
router.get('/user/del/:id', suMiddleware, async (req, res) => {

});


/**
 * @url: /admin/home/apps
 * @method: GET
 * @template: views/superadmin/apps.handlebars
 * @desc: List View of all Applications
 */
router.get('/apps', suMiddleware, async (req, res) => {
	let apps = await utils.Application.findAll();
	res.render('superadmin/apps', { title: 'Admin', layout: 'base', application: apps });
});


/**
 * @url: /admin/home/locations
 * @method: GET
 * @template: views/superadmin/managelocation.handlebars
 * @desc: Display all available locations ( restricted to superadmins )
 */
router.get('/locations', suMiddleware, async(req, res) => {
	let locations = await utils.LocationMaster.getAllSuperadminLocations();
	res.render('superadmin/managelocation', { title: 'Locations Master', layout: 'base', locations: locations });
});


/**
 * @url: /admin/home/beacon
 * @method: GET
 * @template: views/superadmin/newbeacon.handlebars
 * @desc: Add new publicly available beacon
 */
router.get('/beacon', suMiddleware, async(req, res) => {
	let locations = await utils.LocationMaster.getAllSuperadminLocations();
	res.render('superadmin/newbeacon', { title: 'Beacon Master', layout: 'base', locations: locations })
});


/**
 * @url: /admin/home/beacon
 * @method: POST
 * @desc: Add new public beacon
 * 
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
 */
router.get('/beacon/:id', suMiddleware, async(req, res) => {
	let beacon = await utils.BeaconMaster.findOne(req.params.id);
	let locations = await utils.LocationMaster.getAllSuperadminLocations();
	let tags = [];
	beacon.tags.map(tag => {
		tags.push(tag.tag);
	})
	res.render('superadmin/beacon', { title: 'Beacon Master', layout: 'base', beacon: beacon, locations: locations, tag: tags.join(',') })
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
});


/**
 * @url: /admin/home/profile/:id
 * @method: GET
 * @template: views/admin/userprofile.handlebars
 * @desc: App User Profile
 * 
 * @todo: Add beacon and wifis and heat map
 */
router.get('/profile/:id', authMiddleware, async (req, res) => {
	let analytics = await utils.Analytics.getAppUserLevelInfo(req.params.id);
	res.render('admin/userprofile', analytics);
});


/**
 * @url: /admin/home/profile/:id/:long
 * @method: GET
 * @template: views/admin/viewonmap.handlebars
 * @desc: View User Lat,Long on Map
 */
router.get('/profile/:id/:long', authMiddleware, async (req, res) => {
	let data = await model.location.findOne({where: {id: req.params.long, deviceId: req.params.id}});
	let deviceId = await model.device.findOne({where: {id: req.params.id}})
	res.render('admin/viewonmap', { title: 'Admin', layout: 'base', data: data, deviceId: deviceId });
});


module.exports = router;