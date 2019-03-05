const Memcached = require('memcached');
const cache = new Memcached('127.0.0.1:11211');

function setCampaign(token, campaignId){
    // cache.touch(token, 3600);
    // cache.set(token, campaignId, 3600);
    cache.get(token, (err, data) => {
        console.log(err);
        console.log(data);
    })
}

setCampaign('token', 1);