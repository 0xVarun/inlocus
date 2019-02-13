const express 			= require('express');
const router			= express.Router();
const User				= require('../../utils/User');
const authMiddleware	= require('../../middleware/auth');
const appMiddleware		= require('../../middleware/active_application');
const moment			= require('moment');

router.get('/new', authMiddleware, (req, res) => {
	res.render('admin/campaign', { title: 'New Campaign', layout: 'home' });
});

router.get('/', authMiddleware, (req, res) => {
	res.render('admin/campaigns', { title: 'Campaigns', layout: 'home' });
})

router.post('/create', authMiddleware, (req, res) => {
	let startdate = req.body.startdate;
	let enddate = req.body.enddate;
	let starttime = req.body.starttime + ":00";
	let endtime = req.body.endtime + ":00";
	console.log(`${startdate}\t${enddate}\t${starttime}\t${endtime}`);
	res.redirect('/admin/campaigns/new');
})

module.exports = router;