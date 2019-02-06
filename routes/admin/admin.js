const express 			= require('express');
const router			= express.Router();
const authMiddleware	= require('../../middleware/auth');


router.get('/', authMiddleware, (req, res) => {
	res.render('admin/home')
});

router.get('/logout', authMiddleware, (req, res) => {
	req.logout();
	res.redirect('/admin/login');
})

module.exports = router;