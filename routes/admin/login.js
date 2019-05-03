const express 			= require('express');
const router			= express.Router();
const adminUser			= require('../../utils/User.js')
const passport			= require('passport');
const LocalStrategy		= require('passport-local').Strategy;
const authMiddleware	= require('../../middleware/auth');


/**
 * @url: /admin/login
 * @method: GET
 * @template: views/admin/login
 * @desc: Login Page
 * 
 * @todo: create registration page 
 */
router.get('/', (req, res) => {
	if(req.isAuthenticated()) {
		res.redirect('/admin/home');
		return;
	}
	req.flash('error_message', '');
	res.render('admin/login');
});


router.get('/forgot', (req, res) => {
	res.render('admin/forgotpass');
})


passport.use(new LocalStrategy({usernameField: 'email'}, (email, password, done) => {
	adminUser.getUserByEmail(email, (err, user) => {
		if(err) throw err;
		if(!user) return done(null, false, {message: 'Unknown User'});
		if(!user.role.active) return done(null, false, { message: 'User Account pending activation' });
		adminUser.authenticateUser(password, user.password, (err, isMatch) => {
			if(err) throw err;
			if(isMatch){
   				return done(null, user);
	   		} else {
	   			return done(null, false, {message: 'Invalid password'});
	   		}
		});
	})
}));

passport.serializeUser((user, done) => {
	done(null, user.id);
});

passport.deserializeUser((id, done) => {
	adminUser.getUserById(id, (err, user) => {
		done(err, user);
	});
});


/**
 * @url: /
 * @method: POST
 * @desc: Login Post call, responsible for authenticating user and settings role perms
 */
router.post('/', 
	passport.authenticate('local', { successRedirect:'/admin/home', failureRedirect:'/admin/login',failureFlash: true }) ,
	(req, res) => {
	res.redirect('/admin/home');
});


/**
 * @url /admin/login/logout
 * @method: GET
 * @desc: Log user out and destroy session
 */
router.get('/logout', authMiddleware, (req, res) => {
	req.logout();
	res.redirect('/admin/login');
})

module.exports = router;