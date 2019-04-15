// const Memcached = require('memcached');

// var memcached = new Memcached('localhost:11211', {retries:10,retry:10000,remove:true,failOverServers:['127.0.0.1:11211']});


const model  = require('./models');

model.user
		.findAll({ include: [ { model: model.application}, {model: model.roles, where: {appstaff: false}} ] })
		.then( user => { return JSON.stringify(user); } )
		.catch( err => { throw err; })