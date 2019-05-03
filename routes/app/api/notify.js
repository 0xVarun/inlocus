const express 		= require('express');
const router 		= express.Router();
const utils 		= require('../../../utils');
const apiMiddleware = require('../../../middleware/api').apiAuth;

router.get('/:id/:type', apiMiddleware, async (req, res) => {
    let deviceId = res.locals.user['deviceId'];
    let appId   = res.locals.user['appId'];
    let campaignId = req.params.id;
    let type = req.params.id;
    
    await utils.Notify.clicked("CLICKED", deviceId, appId, campaignId, type);

    res.sendStatus(200);
});


module.exports = router;
