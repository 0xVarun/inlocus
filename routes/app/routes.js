const express 	= require('express');
const router	= express.Router();

// const login		= require('./login');
const register	= require('./registerDevice');

// router.use('/login', login);
router.use('/registerDevice', register);

module.exports = router;