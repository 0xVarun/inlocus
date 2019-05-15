const assert 	= require('chai').assert;
const utils 	= require('../utils');
// const model     = require('../models');
const db		= require('../db/postgres');

describe('LocationCampaign', () => {

    it('should return campaign when inside geolocation', async () => {
        let lCampaign = await utils.Campaign.getOneLocationCampaign(1, '19.007711', '72.82958');
        assert.isNotNull(lCampaign);
    });
    
    it('Outside Geofence should return null', async () => {
        let lCampaign = await utils.Campaign.getOneLocationCampaign(1, '20.007711', '78.82958');
        assert.isNull(lCampaign);
    });

    it('', async () => {
        
    })
})

after(function () {
    db.close();
});
