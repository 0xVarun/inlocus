const express 			= require('express');
const router			= express.Router();
const User				= require('../../utils/User');
const Application		= require('../../utils/Application');
const suMiddleware		= require('../../middleware/superadmin');
const authMiddleware	= require('../../middleware/auth');

router.get('/create', suMiddleware, async (req, res) => {
	let application = await Application.findAll();
	res.render('superadmin/newuser', { title: 'New User', layout: 'home', apps: application });
});

router.post('/staff', authMiddleware, async (req, res) => {
	let name = req.body.fname + ' ' + req.body.lname;
	let username = req.body.username;
	let email = req.body.email;
	let password = req.body.password;
	let password2 = req.body.password2;
	let app = req.user.applicationId;

	if(password !== password2) {
		req.flash('error', 'Passwords do not match');
		res.redirect('/admin/user/staff');
		return;
	}

	let pass_regex = /^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9]{7,}$/;

	if(!pass_regex.test(password)) {
		req.flash('error', 'Please use a stronger passwords');
		res.redirect('/admin/user/staff');
		return;
	}
	
	let newUser = undefined;

	try {
		newUser = await User.registerStaffUser(name, username, email, password, app);
	} catch(err) {
		let er = err.name;
		er = er.replace(/Sequelize/gi, '');
		er = er.replace(/([A-Z])/g, ' $1').trim()
		req.flash('error', er);
		res.redirect('/admin/user/create');
		return;
	}

	res.redirect('/admin/staff');
})

router.post('/create', suMiddleware, async (req, res) => {
	let name = req.body.fname + ' ' + req.body.lname;
	let username = req.body.username;
	let email = req.body.email;
	let password = req.body.password;
	let password2 = req.body.password2;
	let app = req.body.app;

	if(password !== password2) {
		req.flash('error', 'Passwords do not match');
		res.redirect('/admin/user/create');
		return;
	}

	let pass_regex = /^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9]{7,}$/;

	if(!pass_regex.test(password)) {
		req.flash('error', 'Please use a stronger passwords');
		res.redirect('/admin/user/create');
		return;
	}
	
	let newUser = undefined;

	try {
		newUser = await User.registerUser(name, username, email, password, app);
	} catch(err) {
		let er = err.name;
		er = er.replace(/Sequelize/gi, '');
		er = er.replace(/([A-Z])/g, ' $1').trim()
		req.flash('error', er);
		res.redirect('/admin/user/create');
		return;
	}

	res.redirect('/admin/home/users');
})

module.exports = router;