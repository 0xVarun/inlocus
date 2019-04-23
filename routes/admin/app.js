const express 			= require('express');
const router			= express.Router();
const utils			 	= require('../../utils');
const User				= require('../../utils/User');
const Application		= require('../../utils/Application');
const GeoFence 			= require('../../utils/GeoFence');
const LocationMaster	= require('../../utils/LocationMaster');
const Sensor			= require('../../utils/Sensor');
const BeaconMaster		= require('../../utils/BeaconMaster');
const authMiddleware	= require('../../middleware/auth');
const suMiddleware		= require('../../middleware/superadmin');
const model 			= require('../../models');
const apiKey            = require('uuid-apikey');


/**
 * @url: /admin/app
 * @method: GET
 * @template: views/admin/adminapps.handlebars
 * @desc: Displays all user apps created by the current app user
 * 
 * @TODO: Display all apps created by all admins of the app
 */
router.get('/', authMiddleware, async (req, res) => {
    let userApps = await Application.findAllUserApps(req.user.id);
	res.render('admin/adminapps', { title: 'Admin', layout: 'base', application: userApps });    
});


/**
 * @url: /admin/app/create
 * @method: GET
 * @template: views/admin/adminapp.handlebars
 * @desc: lets user create new application 
 * 				and submit them for approval
 */
router.get('/create', authMiddleware, async (req, res) => {
    let keys = apiKey.create();
	res.render('admin/adminapp', { title: 'Admin', layout: 'base', keys: keys });    
});


/**
 * @url: /admin/app/create
 * @method: POST
 * @desc: Insert the admin application details
 * 
 */
router.post('/create', authMiddleware, async (req, res) => {
	let applicationName = req.body.applicationName
	let applicationUrl = req.body.applicationUrl
	let applicationKey = req.body.applicationKey
	let applicationSecret = req.body.applicationSecret
	let applcationCategory = req.body.applcationCategory
	let applicationStatus = req.body.applicationStatus == 1 ? true : false;

	await utils.Application.registerApplication(applicationName, applicationUrl, applicationKey, applicationSecret, false, applcationCategory, applicationStatus, req.user.id);
	
	res.redirect('/admin/app');
});


/**
 * @url: /admin/app/:id
 * @method: GET
 * @template: views/admin/editapp.handlebars
 * @desc: This route displays the admin application
 * 
 * @note: Only editable filed is Production status 
 * 
 */
router.get('/:id', authMiddleware, async (req, res) => {
	let app = await Application.findOneApp(req.user.id, req.params.id);
	res.render('admin/editapp', { title: 'Admin', layout: 'base', application: app });
});


/**
 * @url: /admin/app/:id
 * @method: POST
 * @desc: This route updates the admin application
 * 
 * @note: With an approved application, the admin can only 
 * 		update the application status from development to production
 * 		or vice versa
 */
router.post('/:id', authMiddleware, async (req, res) => {

});

module.exports = router;