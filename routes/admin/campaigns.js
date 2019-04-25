const express 			= require('express');
const router			= express.Router();
const utils				= require('../../utils');
const authMiddleware	= require('../../middleware/auth');
const appMiddleware		= require('../../middleware/active_application');
const formidable		= require('formidable');
const move 				= require('mv');
const path 				= require('path');
const uuid				= require('uuid/v4');


/**
 * @url: /admin/campaigns/create
 * @method: GET
 * @template: views/admin/campaign.handlebars
 * @desc: Create a New Campaign
 * 
 * @todo: Content Creation
 */
router.get('/create', authMiddleware, (req, res) => {
	res.render('admin/campaign', { title: 'New Campaign', layout: 'base' });
});


/**
 * @url: /admin/campaigns/create
 * @method: POST
 * @desc: Create campaign entry in database
 */
router.post('/create', authMiddleware, (req, res) => {
	let campaignName = req.body.campaign_name;
	let campaignTitle = req.body.campaign_title;
	let startTime = new Date(req.body.start_time);
	let endTime = new Date(req.body.end_time + " 23:59:59");
	let campaignText = req.body.campaign_text;
	let location = req.body.location;
	let tags = req.body.pretags;
	let action = req.body.action;
	let application = req.body.applications;
	let type = req.body.campaign_type;
	let content = req.body.content;

	if(type === 'IMAGE') {

	}

	res.redirect('/admin/campaigns/create');
});


/**
 * @url: /admin/campaigns/locations
 * @method: GET
 * @returns: JSON array of Locations
 * @desc: Used by new campaigns to provide list of locations
 * 
 * @todo: Send all superuser created locations and admin only created locations
 */
router.get('/locations', authMiddleware, async(req, res) => {
	let locations = await utils.LocationMaster.getAllSuperadminLocations();
	let d = [];
	locations.map(loc => {d.push({ "value": loc.id, "text": loc.name + '(' + loc.type + ')' });});
	res.json(d);
});


/**
 * @url: /admin/campaigns/contents
 * @method: GET
 * @returns: JSON array of user created contents
 * @desc: Attach Content to Campagin
 */
router.get('/contents', authMiddleware, async(req, res) => {
	let contents = await utils.Content.findAll(req.user.id);
	let jcontent = [];
	contents.map(content => {jcontent.push({"value": content.id, "text": content.name})});
	res.json(jcontent);
})


/**
 * @url: /admin/campaigns/apps
 * @method: GET
 * @returns: JSON array of approved apps
 * @desc: Used by new campaigns creation to specify app for campaign
 */
router.get('/apps', authMiddleware, async(req, res) => {
	let apps = await utils.Application.findAllUserApprovedApps(req.user.id);
	let japps = [];
	apps.map(app => { japps.push({ "value": app.id, "text": app.name }); })
	res.json(japps);
});


/**
 * @url: /admin/campaigns/edit/:id
 * @method: GET
 * @template: views/admin/editcampaign.handlebars
 */
router.get('/edit/:id', authMiddleware, async (req, res) => {
	let camp = await require('../../models').campaign.findOne(req.param.id);
	res.render('admin/editcampaign', { title: 'Edit Campaigns', layout: 'base', campaign: camp });
});


/**
 * @url: /admin/campaigns
 * @method: GET
 * @template: views/admin/campaigns.handlebars
 * @desc: List all campaigns created by Users
 * 
 * @todo: add render template
 */
router.get('/', authMiddleware, async(req, res) => {
	let campaigns = await utils.Campaign.findAllCampaigns(req.user.applicationId);
	res.render('admin/campaigns', { title: 'Campaigns', layout: 'base', campaigns: campaigns });
});

module.exports = router;