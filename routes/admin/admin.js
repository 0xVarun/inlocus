const express 			= require('express');
const router			= express.Router();
const User				= require('../../utils/User');
const authMiddleware	= require('../../middleware/auth');


router.get('/', authMiddleware, (req, res) => {
	res.render('admin/home', { title: 'Admin', layout: 'home' });
});

router.get('/users', authMiddleware,async (req, res) => {
	let Users = await User.getAll();
	res.render('admin/users', { title: 'Admin', layout: 'home', adminuser: Users });
})

module.exports = router;