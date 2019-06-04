const express 			= require('express');
const router			= express.Router();
const utils				= require('../../utils');
const model				= require('../../models');
const authMiddleware	= require('../../middleware/superadmin'); // change to auth
const geolib			= require('geolib');


/**
 * @url: /admin/analytics/api/heatmap
 * @method: GET
 * @desc: return all user coordinates, and center of all coordinates
 */
router.get('/api/heatmap', authMiddleware, async(req, res) => {
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


/**
 * @url: /admin/analytics
 * @method: GET
 * @template: views/admin/analytics
 * @desc: Display analytics from data recieved from SDK
 * 
 * @todo: UI design
 */
router.get('/', authMiddleware, async (req, res) => {
	let geofences = await utils.GeoFence.findAllFences(req.user.id)
	res.render('admin/analytics', { title: 'Admin', layout: 'base', geofence: geofences });
});


module.exports = router;