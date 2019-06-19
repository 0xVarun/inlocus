const express 		= require('express');
const router 		= express.Router();
const utils 		= require('../../../utils');
const apiMiddleware = require('../../../middleware/api').apiAuth;

router.get('/:id', apiMiddleware, async (req, res) => {
    let notificationId = req.params.id;
    
    await utils.Notify.clicked(notificationId);

    res.sendStatus(200);
});


module.exports = router;
