// const Memcached = require('memcached');

// var memcached = new Memcached('localhost:11211', {retries:10,retry:10000,remove:true,failOverServers:['127.0.0.1:11211']});


const models  = require('./models');

models.tags.create({
    tag: 'AWFIS',
    beaconMasterId: 2
});
models.tags.create({
    tag: 'Office',
    beaconMasterId: 2
});
models.tags.create({
    tag: 'Hiranandani Powai',
    beaconMasterId: 2
});
models.tags.create({
    tag: 'Co-Working Space',
    beaconMasterId: 2
});