const express 		= require('express');
const router		= express.Router();
const utils			= require('../../utils/');


/**
 * @url: /admin/register
 * @method: GET
 * @template: views/admin/register
 * @desc: Register a user but do not allow login until approved
 */
router.get('/', (req, res) => {
	res.render('admin/register');
});


/**
 * @url: /admin/register
 * @method: POST
 * @desc: save registering user but do not allow login until approved
 */
router.post('/', async (req, res) => {
	let username = req.body.username;
	let name = req.body.name;
	let email = req.body.email;
	let password = req.body.password;
	let password2 = req.body.password2;
	let userType = req.body.userType || null;

	console.log(userType);

	req.checkBody('name', 'Name is required filed').notEmpty();
	req.checkBody('username', 'Username is required filed').notEmpty();
	req.checkBody('email', 'Email is required filed').notEmpty();
	req.checkBody('password', 'Password is required filed').notEmpty();
	req.checkBody('userType', 'User Type is required filed').not().isEmpty();
	req.checkBody('email', 'Email is not valid').isEmail();
	req.checkBody('password', 'Passwords don\'t match').equals(password2);

	let errors = req.validationErrors();

	if(errors) {
		console.log(errors);
	}


	res.redirect('/admin/login');
});

module.exports = router;

