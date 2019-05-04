const models            = require('../models');
const Cache             = require('../campaign/cache').addToCache;

function cacheAll() {
  models.campaign.findAll({ attributes: ['id'] })
  .then(campaigns => {
    campaigns.map(campaign => {
      Cache(campaign.id);
    })
  })
  .catch(err => { console.log(err) }); 
}

module.exports = cacheAll;