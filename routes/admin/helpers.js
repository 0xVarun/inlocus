const express 			= require('express');
const router			= express.Router();
const User				= require('../../utils/User');
const Staff				= require('../../utils/Staff');
const Application 		= require('../../utils/Application');
const suMiddleware		= require('../../middleware/superadmin');
const authMiddleware	= require('../../middleware/auth');
const keys				= require('uuid-apikey');

/**
 * Activate User
 */
router.get('/user/activate/:id', suMiddleware, async (req, res) => {
	await User.activateUser(req.params.id);
	res.redirect('/admin/home/users');
});

/**
 * Deactivate User
 */
router.get('/user/deactivate/:id', suMiddleware, async (req, res) => {
	await User.deActivateUser(req.params.id);
	res.redirect('/admin/home/users');
});

/**
 * Make User Superadmin
 */
router.get('/user/mksu/:id', suMiddleware, async (req, res) => {
	await User.mkSuperadmin(req.params.id);
	res.redirect('/admin/home/users');
});

/**
 * Remove Superadmin privileges from User
 */
router.get('/user/rmsu/:id', suMiddleware, async (req, res) => {
	await User.rmSuperadmin(req.params.id);
	res.redirect('/admin/home/users');
});

/**
 * make App Admin User
 */
router.get('/user/appadmin/mk/:id', suMiddleware, async (req, res) => {
	await User.mkAppAdmin(req.params.id);
	res.redirect('/admin/home/users');
})

/**
 * rm App Admin User
 */
router.get('/user/appadmin/rm/:id', suMiddleware, async (req, res) => {
	await User.rmAppAdmin(req.params.id);
	res.redirect('/admin/home/users');
})

/**
 * make Staff User
 */
router.get('/user/staff/mk/:id', authMiddleware, async (req, res) => {
	await User.activateUser(req.params.id);
	res.redirect('/admin/staff')
})

/**
 * rm Staff User
 */
router.get('/user/staff/rm/:id', authMiddleware, async (req, res) => {
	await User.deActivateUser(req.params.id);
	res.redirect('/admin/staff');
})

/**
 * Delete User
 */
router.get('/user/delete/:id', suMiddleware, async (req, res) => {
	await User.removeUser(req.params.id)
	res.redirect('/admin/home/users');
});

/**
 * Generate API Keys
 */
router.get('/genkeys', (req, res) => {
	res.send(JSON.stringify(keys.create()));
});

/**
 * Activate Application
 */
router.get('/app/activate/:id', async (req, res) => {
	await Application.activateApp(req.params.id);
	res.redirect('/admin/home/apps');
});

/**
 * Deactivate Application
 */
router.get('/app/deactivate/:id', async (req, res) => {
	await Application.deactivateApp(req.params.id);
	res.redirect('/admin/home/apps');
});

/**
 * Activate campaign creation on application
 */
router.get('/app/cactivate/:id', async (req, res) => {
	await Application.mkCampaignReady(req.params.id);
	res.redirect('/admin/home/apps');
});

/**
 * Deactivate campaign creation on application
 */
router.get('/app/cdeactivate/:id', async (req, res) => {
	await Application.rmCampaignReady(req.params.id);
	res.redirect('/admin/home/apps');
});

module.exports = router;