const express 			= require('express');
const router			= express.Router();
const utils				= require('../../utils');
const model				= require('../../models');
const authMiddleware	= require('../../middleware/superadmin'); // change to auth
const geolib			= require('geolib');


/**
 * @url: /admin/analytics/api/heatmap/location
 * @method: GET
 * @desc: return all user coordinates, and center of all coordinates
 */
router.get('/api/heatmap/location', authMiddleware, async(req, res) => {
	let userId = req.user.id;
	let su = req.user.role.superadmin
	let data = await utils.Analytics.getAllLocations(su, userId)
	let center = geolib.getCenterOfBounds(JSON.parse(JSON.stringify(data)));
	res.json({data, center});
});


/**
 * @url: /admin/analytics/api/heatmap/beacon
 * @method: GET
 * @desc: return all user coordinates, and center of all coordinates
 */
router.get('/api/heatmap/beacon', authMiddleware, async(req, res) => {
	let userId = req.user.id;
	let su = req.user.role.superadmin
	let data = await utils.Analytics.getAllBeaconLocations(su, userId)
	let center = geolib.getCenterOfBounds(JSON.parse(JSON.stringify(data)));
	res.json({data, center});
});


/**
 * @url: /admin/analytics/api/heatmap/location
 * @method: GET
 * @desc: return all user coordinates, and center of all coordinates
 */
router.get('/api/heatmap/location', authMiddleware, async(req, res) => {
	let userId = req.user.id;
	let su = req.user.role.superadmin
	let data = await utils.Analytics.getAllLocations(su, userId)
	let center = geolib.getCenterOfBounds(JSON.parse(JSON.stringify(data)));
	res.json({data, center});
});



/**
 * @url: /admin/analytics/geofence/:id
 * @method: GET
 * @desc: return all coordinates inside the geofence id
 * @param: <Number> id   geofence Id 
 */
router.get('/geofence/:id', authMiddleware, async(req, res) => {
	let heat = await utils.GeoFence.usersInGeofence(req.params.id, req.user.id);
	let center = geolib.getCenterOfBounds(JSON.parse(JSON.stringify(heat)));
	res.json({data: heat, center});
});


router.get('/data', authMiddleware, (req, res) => {
	let d = [
	    {"date" : "12/09/17", "value": 83, "module": 0},
	    {"date" : "19/09/17", "value": 79, "module": 1},
	    {"date" : "26/09/17", "value": 78, "module": 2},
	    {"date" : "30/09/17", "value": 73, "module": 3},
	    {"date" : "08/10/17", "value": 71, "module": 4},
	    {"date" : "15/10/17", "value": 67, "module": 5},
	    {"date" : "22/10/17", "value": 65, "module":6}
	];
	res.json(d);
});


/**
 * @url: /admin/analytics/dwell
 * @method: GET
 * @template: views/admin/dwelltime.handlebars
 * @desc: App Wise user dwell time
 */
router.get('/dwell', authMiddleware, async(req, res) => {
	res.render('admin/dwelltime', { title: 'Admin', layout: 'analytics' });
});



/**
 * @url: /admin/analytics/heatmap?type={location, beacon, wifi, geofence}
 * @method: GET
 * @template: views/admin/heatmap-{location, beacon, wifi, geofence}.handlebars
 * @desc: Application Heatmap
 */
router.get('/heatmap', authMiddleware, async(req, res) => {
	let heatmapType = req.query['type'];
	let data = {};
	if(!heatmapType) {
		res.redirect('/');
		return;
	}
	if (heatmapType == 'beacon') { data = await model.beacon.findAll({ include: { model: model.device } }); } 
	if (heatmapType == 'location') { data = await model.location.findAll({ include: { model: model.device } }); } 
	res.render(`admin/heatmap-${heatmapType}`, { title: 'Admin', layout: 'analytics', data: data });
})


/**
 * @url: /admin/analytics
 * @method: GET
 * @template: views/admin/analytics
 * @desc: Display analytics from data recieved from SDK
 * 
 * @todo: UI design
 */
router.get('/', authMiddleware, async (req, res) => {
	// let geofences = await utils.GeoFence.findAllFences(req.user.id)
	// res.render('admin/analytics', { title: 'Admin', layout: 'base', geofence: geofences });
	res.render('admin/analytics', { title: 'Admin', layout: 'analytics' });
});


module.exports = router;