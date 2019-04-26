// const Memcached = require('memcached');

// var memcached = new Memcached('localhost:11211', {retries:10,retry:10000,remove:true,failOverServers:['127.0.0.1:11211']});


const model  = require('./models');

model.campaign.findAll({
	include:[
		{
			model:model.content
		},
		{
			model: model.application
		}, 
		{
			model: model.CampaignLocation,
			include: {
				model: model.location_master,
			}
		}
	] 
})
	.then(c => { 
		let x = JSON.parse(JSON.stringify(c));
		console.log(JSON.stringify(x)) 
	});