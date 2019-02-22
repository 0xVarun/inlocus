const express 	= require('express');
const router	= express.Router();

const beacon 	= require('./beacon');
const wifi 		= require('./wifi');
const location	= require('./location');

router.use('/wifi', wifi);
router.use('/beacon', beacon);
router.use('/location', location);

module.exports = router;