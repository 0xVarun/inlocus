const express 			= require('express');
const router			= express.Router();
const GeoFence 			= require('../../utils/GeoFence');
const authMiddleware	= require('../../middleware/auth');
const suMiddleware		= require('../../middleware/superadmin');


/**
 * @url: /admin/geofence
 * @method: GET
 * @template: views/admin/managegeofence.handlebars
 * @desc: View all Geofences
 */
router.get('/', authMiddleware, async (req, res) => {
    let fences = await GeoFence.findAllFences(req.user.id);
    res.render('admin/managegeofence', { title: 'Admin', layout: 'base', fences: fences});
});


/**
 * @url: /admin/geofence/create
 * @method: GET
 * @template: views/admin/geofence.handlebars
 * @desc: Create New Geofences
 */
router.get('/create', authMiddleware, async (req, res) => {
    res.render('admin/geofence', { title: 'Admin', layout: 'base'});
});


/**
 * @url: /admin/geofence/create
 * @method: POST
 * @desc: Save Geofence
 */
router.post('/create', authMiddleware, async (req, res) => {
    let name = req.body.fence_name;
    let lat  = req.body.latitude;
    let lng  = req.body.longitude;
    let rad  = req.body.radius;

    await GeoFence.create(name, req.user.id, lat, lng, rad);

    res.redirect('/admin/geofence/create');
});


/**
 * @url: /admin/geofence/:id
 * @method: GET
 * @template: views/admin/editgeofence
 * @desc: View and Edit already created GeoFence
 */
router.get('/:id', authMiddleware, async (req, res) => {
    let fence = await GeoFence.findOneFence(req.params.id);
    res.render('admin/editgeofence', { title: 'Admin', layout: 'base', fence: fence});
});


/**
 * @url: /admin/geofence/:id
 * @method: POST
 * @desc: View and Edit already created GeoFence
 */
router.post('/:id', authMiddleware, async (req, res) => {
    let payload = {
        lat: req.body.latitude,
        lng: req.body.longitude,
        name: req.body.fence_name,
        rad: req.body.radius
    };

    await GeoFence.findOneAndUpdate(req.params.id, payload);

    res.redirect(`/admin/geofence/${req.params.id}`);

});

module.exports = router;