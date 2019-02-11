const express 	= require('express');
const router	= express.Router();

const login		= require('./login');
const register	= require('./register');
const admin		= require('./admin');
const campaigns	= require('./campaigns');

router.use('/login', login);
router.use('/register', register);
router.use('/home', admin);
router.use('/campaigns', campaigns);
router.use('/', (req, res) => { res.redirect('/admin/login'); })

module.exports = router;