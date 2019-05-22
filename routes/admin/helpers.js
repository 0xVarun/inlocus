const express 			= require('express');
const router			= express.Router();
const User				= require('../../utils/User');
const Application 		= require('../../utils/Application');
const utils				= require('../../utils');	
const suMiddleware		= require('../../middleware/superadmin');
const authMiddleware	= require('../../middleware/auth');
const keys				= require('uuid-apikey');


/**
 * @url: /admin/api/user/activate/:id
 * @method: GET
 * @desc: Activate User By Id
 */
router.get('/user/activate/:id', suMiddleware, async (req, res) => {
	let id = req.params.id;
	await utils.User.activate(id);
	res.redirect('/admin/home/users');
});


/**
 * @url: /admin/api/user/deactivate/:id
 * @method: GET
 * @desc: Deactivate User By Id
 */
router.get('/user/deactivate/:id', suMiddleware, async (req, res) => {
	let id = req.params.id;
	await utils.User.deactivate(id);
	res.redirect('/admin/home/users');
});


/**
 * @url: /admin/api/user/mksu/:id
 * @method: GET
 * @desc: Make Normal User to Superuser By Id
 */
router.get('/user/mksu/:id', suMiddleware, async (req, res) => {
	await User.mkSuperadmin(req.params.id);
	res.redirect('/admin/home/users');
});


/**
 * @url: /admin/api/user/rmsu/:id
 * @method: GET
 * @desc: Remove superuser privileges from user by Id
 */
router.get('/user/rmsu/:id', suMiddleware, async (req, res) => {
	await User.rmSuperadmin(req.params.id);
	res.redirect('/admin/home/users');
});


/**
 * @url: /admin/api/user/delete/:id
 * @method: GET
 * @desc: Delete User By Id
 */
router.get('/user/delete/:id', suMiddleware, async (req, res) => {
	await User.removeUser(req.params.id)
	res.redirect('/admin/home/users');
});


/**
 * @url: /admin/api/app/activate/:id
 * @method: GET
 * @desc: Activate / Approve Application By Id
 */
router.get('/app/activate/:id', async (req, res) => {
	await Application.activateApp(req.params.id);
	res.redirect('/admin/home/apps');
});


/**
 * @url: /admin/api/app/deactivate/:id
 * @method: GET
 * @desc: Deactivate / Disapprove Application By Id
 */
router.get('/app/deactivate/:id', async (req, res) => {
	await Application.deactivateApp(req.params.id);
	res.redirect('/admin/home/apps');
});


module.exports = router;