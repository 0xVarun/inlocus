const express 			= require('express');
const router			= express.Router();
const authMiddleware	= require('../../middleware/auth');


router.get('/', authMiddleware, (req, res) => {
	res.render('admin/home')
});



module.exports = router;