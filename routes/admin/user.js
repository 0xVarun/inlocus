const express 			= require('express');
const router			= express.Router();
const utils				= require('../../utils');
const authMiddleware	= require('../../middleware/auth');


router.get('/', authMiddleware, async(req, res) => {
	res.render('admin/manageusers', { title: 'Admin', layout: 'base' });
})

module.exports = router;