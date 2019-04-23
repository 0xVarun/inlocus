const express 			= require('express');
const router			= express.Router();
const authMiddleware	= require('../../middleware/auth');
const utils 			= require('../../utils');


/**
 * @url: /admin/location
 * @method: GET
 * @template: views/admin/managelocation.handlebars
 * @desc: List View of all User added location
 */
router.get('/', authMiddleware, async (req, res) => {
    let locations = await utils.LocationMaster.getAllLocations(req.user.id);
    res.render('admin/managelocation', { title: 'Admin', layout: 'base', locations: locations });
});


/**
 * @url: /admin/location/create
 * @method: GET
 * @template: views/admin/location.handlebars
 * @desc: Create New Location
 */
router.get('/create', authMiddleware, (req, res) => {
    res.render('admin/location', { title: 'Admin', layout: 'base'});
});


/**
 * @url: /admin/location/create
 * @method: POST
 * @desc: Insert New Location into Database
 */
router.post('/create', authMiddleware, async (req, res) => {
    let name = req.body.locationName;
    let type = req.body.locationtype;
    let latitude = req.body.latitude;
    let longitude = req.body.longitude;

    let location = await utils.LocationMaster.createLocations(name, type, latitude, longitude, req.user.id);
    await utils.Tag.createLocationTag(req.body.ctags, location.id, req.user.id);

    res.redirect('/admin/location/create');
});


module.exports = router;