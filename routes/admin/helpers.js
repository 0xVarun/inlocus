const express 			= require('express');
const router			= express.Router();
const User				= require('../../utils/User');
const Application 		= require('../../utils/Application');
const suMiddleware		= require('../../middleware/superadmin');
const keys				= require('uuid-apikey');

router.get('/activate/:id', suMiddleware, async (req, res) => {
	let updated = await User.activateUser(req.params.id);
	res.redirect('/admin/home/users');
});

router.get('/deactivate/:id', suMiddleware, async (req, res) => {
	let updated = await User.deActivateUser(req.params.id);
	res.redirect('/admin/home/users');
});

router.get('/mksu/:id', suMiddleware, async (req, res) => {
	let updated = await User.mkSuperadmin(req.params.id);
	res.redirect('/admin/home/users');
});

router.get('/rmsu/:id', suMiddleware, async (req, res) => {
	let updated = await User.rmSuperadmin(req.params.id);
	res.redirect('/admin/home/users');
});

router.get('/genkeys', (req, res) => {
	res.send(JSON.stringify(keys.create()));
});

router.get('/app/activate/:id', async (req, res) => {
	await Application.activateApp(req.params.id);
	res.redirect('/admin/home/apps');
});

router.get('/app/deactivate/:id', async (req, res) => {
	await Application.deactivateApp(req.params.id);
	res.redirect('/admin/home/apps');
});

router.get('/app/cactivate/:id', async (req, res) => {
	await Application.mkCampaignReady(req.params.id);
	res.redirect('/admin/home/apps');
});

router.get('/app/cdeactivate/:id', async (req, res) => {
	await Application.rmCampaignReady(req.params.id);
	res.redirect('/admin/home/apps');
});

module.exports = router;