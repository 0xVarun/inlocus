const express 			= require('express');
const router			= express.Router();
const authMiddleware	= require('../../middleware/auth');
const utils 			= require('../../utils');


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
	let locations = await utils.LocationMaster.getAllLocations()
	res.render('admin/adminbeacon', { title: 'Admin', layout: 'base', locations: locations});
});


/**
 * @url: /admin/beacon/create
 * @method: POST
 * @desc: Insert new Beacon into database
 * 
 * @TODO: adding beacon to beacon master or create new table
 */
router.post('/create', authMiddleware, async (req, res) => {
	/**
	 * { 
	 * 		major,
	 * 		minor,
	 * 		uuid,
	 * 		ctags,
	 * 		shortlink,
	 * 		location 
	 * }
	 */
	let major = req.body.major;
	let minor = req.body.minor;
	let uuid = req.body.uuid;
	let ctags = req.body.ctags;
	let shortlink = req.body.shortlink;
	let location = req.body.location;

	let beacon = await utils.BeaconMaster.addNewBeacon(major, minor, uuid, shortlink, location);
	await utils.Tag.createBeaconTag(ctags, beacon.id, req.user.id);

	res.redirect('/admin/beacon/create');
})

module.exports = router;