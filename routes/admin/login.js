const express 		= require('express');
const router		= express.Router();
const db			= require('../../db/postgres');
const passport		= require('passport');
const LocalStrategy	= require('passport-local').Strategy;

router.get('/', (req, res) => {
	res.render('admin/login');
});

router.post('/', (req, res) => {
	const email = req.body.email;
	const password = req.body.password;
	
});

module.exports = router;