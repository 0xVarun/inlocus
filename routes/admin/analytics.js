const express 			= require('express');
const router			= express.Router();
const utils				= require('../../utils');
const model				= require('../../models');
const authMiddleware	= require('../../middleware/superadmin'); // change to auth
const geolib			= require('geolib');


router.get('/api/heatmap', authMiddleware, async(req, res) => {
	let userId = req.user.id;

	let data = await model.location.findAll({
		attributes: ['latitude', 'longitude'],
		// include: [
		// 	{
		// 		model: model.device,
		// 		attributes: [],
		// 		include: {
		// 			model: model.appuser,
		// 			attributes: [],
		// 			include: {
		// 				model: model.application,
		// 				where: {
		// 					userId: userId
		// 				},
		// 				attributes: [],
		// 			}
		// 		}
		// 	}
		// ]
	});

	let center = geolib.getCenterOfBounds(JSON.parse(JSON.stringify(data)));
	res.json({data, center});
});


router.get('/', authMiddleware, async (req, res) => {
	res.render('admin/analytics', { title: 'Admin', layout: 'base' })
});


module.exports = router;