const express 			= require('express');
const router			= express.Router();
const User				= require('../../utils/Staff');
const authMiddleware	= require('../../middleware/auth');

router.get('/', authMiddleware, async (req, res) => {
	res.render('admin/staff', { title: 'New User', layout: 'home' });
});

router.get('/create', authMiddleware, async (req, res) => {
	res.render('admin/staff', { title: 'New Staff User', layout: 'home' });
})

router.post('/create', authMiddleware, async (req, res) => {
	// name, username, email, password, appId
	let name = req.body.fname + ' ' + req.body.lname;
	let username = req.body.username;
	let email = req.body.email;
	let password = req.body.password;
	let password2 = req.body.password2;
	let appId = req.user.appId;

	if(password !== password2) {
		req.flash('error', 'Passwords do not match');
		res.redirect('/admin/staff/create');
		return;
	}

	let pass_regex = /^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9]{7,}$/;

	if(!pass_regex.test(password)) {
		req.flash('error', 'Please use a stronger passwords');
		res.redirect('/admin/staff/create');
		return;
	}
	
	let newUser = undefined;

	try {
		newUser = await User.registerUser(name, username, email, password, appId);
	} catch(err) {
		console.log(err);
		let er = err.name;
		er = er.replace(/Sequelize/gi, '');
		er = er.replace(/([A-Z])/g, ' $1').trim()
		req.flash('error', er);
		res.redirect('/admin/user/create');
		return;
	}

	res.redirect('/admin/staff');

})

module.exports = router;