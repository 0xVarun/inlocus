const express 		= require('express');
const router 		= express.Router();
const utils 		= require('../../../utils');
const apiMiddleware = require('../../../middleware/api').apiAuth;

router.get('/:id', apiMiddleware, async (req, res) => {
    let deviceId = res.locals.user['deviceId'];
    let appId   = res.locals.user['appId'];
    let campaignId = req.params.id;
    
    console.log({deviceId, appId, campaignId});

    res.sendStatus(200);
});

router.get('/', async (req, res) => {
    res.sendStatus(400);
})

module.exports = router;
