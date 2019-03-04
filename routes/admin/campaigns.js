const express 			= require('express');
const router			= express.Router();
const User				= require('../../utils/User');
const Campaign			= require('../../utils/Campaign');
const LocationMaster	= require('../../utils/LocationMaster');
const authMiddleware	= require('../../middleware/auth');
const appMiddleware		= require('../../middleware/active_application');
const formidable		= require('formidable');
const move 				= require('mv');
const path 				= require('path');
const uuid				= require('uuid/v4');

router.get('/new', authMiddleware, async (req, res) => {
	let locations = await LocationMaster.getAllLocations();
	res.render('admin/campaign', { title: 'New Campaign', layout: 'home', locations: locations });
});

router.get('/', authMiddleware, async(req, res) => {
	let campaigns = await Campaign.findAllCampaigns(req.user.applicationId);
	res.render('admin/campaigns', { title: 'Campaigns', layout: 'home', campaigns: campaigns });
})

router.post('/create', authMiddleware, async (req, res) => {
	let form = new formidable.IncomingForm();
	form.parse(req, async (err, fields, files) => {
		let campaign_name = fields['cname'];
		let start_date = fields['startdate'];
		let end_date = fields['enddate'];
		let start_time = fields['starttime'] + ':00';
		let end_time = fields['endtime'] + ':00';
		let content = fields['content'];
		let location = fields['location'];
		let actionUri = fields['actionUri'] || '';

		let start_timestamp = new Date(`${start_date} ${start_time}`);
		let end_timestamp = new Date(`${end_date} ${end_time}`);
		/**
		 * File Handling Begin
		 */
		let upload_dir = path.join(process.cwd(), 'public', 'uploads');
		let temp_file = files['image']['path'];
		let file_ext = files['image']['type'].split('/')[1];
		let file_name = uuid();
		let file = path.join(upload_dir, file_name + '.' + file_ext);
		move(temp_file, file, { mkdirp: false }, err => {});
		/**
		 * File Handling End
		 */

		let static_path = '/uploads/' + file_name + '.' + file_ext;

		let payload = {
			name: campaign_name,
			start_timestamp: start_timestamp,
			end_timestamp: end_timestamp,
			content: content,
			action: actionUri,
			locationMasterId: location,
			applicationId: req.user.applicationId,
			file: static_path
		}

		await Campaign.createCampaign(payload);
		res.redirect('/admin/campaigns/new');
	});

})

module.exports = router;