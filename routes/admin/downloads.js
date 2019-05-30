const express 			= require('express');
const router			= express.Router();
const authMiddleware	= require('../../middleware/auth');


/**
 * @url: /admin/download/sdk
 * @method: GET
 * @desc: Returns SDK
 * 
 */
router.get('/sdk', authMiddleware, async (req, res) => {
    res.redirect('/');
});


module.exports = router;