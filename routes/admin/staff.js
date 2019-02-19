const express 			= require('express');
const router			= express.Router();
const User				= require('../../utils/User');
const authMiddleware	= require('../../middleware/auth');

router.get('/', authMiddleware, async (req, res) => {
	let staffUsers = await User.getAll(req.user.appId);
	res.render('admin/staffs', { title: 'New User', layout: 'home', staffusers: JSON.parse(staffUsers) });
});

router.get('/create', authMiddleware, async (req, res) => {
	res.render('admin/staff', { title: 'New Staff User', layout: 'home' });
});

module.exports = router;