const express 	= require('express');
const router	= express.Router();

const login		= require('./login');
const register	= require('./register');
const admin		= require('./admin');
const campaigns	= require('./campaigns');
const helpers	= require('./helpers');
const user		= require('./user');
const staff		= require('./staff');

router.use('/login', login);
router.use('/register', register);
router.use('/home', admin);
router.use('/api', helpers)
router.use('/campaigns', campaigns);
router.use('/user', user);
router.use('/staff', staff);
router.use('/', (req, res) => { res.redirect('/admin/login'); })

module.exports = router;