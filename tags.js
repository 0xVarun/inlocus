// const Memcached = require('memcached');

// var memcached = new Memcached('localhost:11211', {retries:10,retry:10000,remove:true,failOverServers:['127.0.0.1:11211']});


const model  = require('./models');


async function t(){

	let android = 0;
	let ios = 0;

	let d = await model.device.findAll({ attributes:['GAID'] });
	d.map(x => {

		let type = x['GAID'].split(',')[1].trim().split(' ')[0];

		if(type === 'Android') {
			android++;
		} else if( type === 'iPhone') {
			ios++;
		}
	});

	console.log(JSON.parse(`{"android": ${android}, "iphone": ${ios}}`));
}

t();