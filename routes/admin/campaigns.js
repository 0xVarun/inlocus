const express 			= require('express');
const router			= express.Router();
const User				= require('../../utils/User');
const authMiddleware	= require('../../middleware/auth');

router.get('/new', authMiddleware, (req, res) => {
	res.render('admin/campaign', { title: 'New Campaign', layout: 'home' });
});

router.get('/', authMiddleware, (req, res) => {
	res.render('admin/campaigns', { title: 'Campaigns', layout: 'home' });
})

module.exports = router;