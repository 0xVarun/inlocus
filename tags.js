// const models = require('./models');


// let data = require('./final.json');

// // bssid: DataTypes.STRING,
// // ssid: DataTypes.STRING,
// // rssi: DataTypes.DOUBLE

// async function insertWifi(wifis, locationId) {
// 	for(let i = 0; i < wifis.length; i++) {
// 		console.log(`${wifis[i]['ssid']} - ${wifis[i]['bssid']} - ${locationId}`);

// 		let wif = await models.WifiMaster.create({
// 			ssid: wifis[i]['ssid'] || '',
// 			bssid: wifis[i]['bssid'],
// 			rssi: wifis[i]['rssi'],
// 			locationMasterId: locationId
// 		});

// 	}
// }


// async function insertLocation() {
// 	for(let i = 0; i < data.length; i++) {

// 		let temp = data[i];

// 		console.log(`NEW LOCATION ${temp['location']['Name']} - ${temp['location']['type']}`)

// 		let loc = await models.location_master.create({ 
// 			name: temp['location']['Name'] || '',
// 			type: temp['location']['type'],
// 			latitude: temp['location']['latitude'],
// 			longitude: temp['location']['longitude'],
// 			userId: 1			 
// 		});

// 		console.log(`LOCATION CREATED WITH ID ${loc.id}`);

// 		await insertWifi(temp['wifis'], loc.id);

// 	}
// }

// insertLocation();


// const utils = require('./utils');

// const wifis = [
// 	{"bssid":"14:1f:ba:74:73:08","ssid":"Joispot-wifi","freq":-42,"rssi":0,"distance":2462},
// 	{"bssid":"78:32:1b:9a:e5:90","ssid":"Osmos","freq":-42,"rssi":0,"distance":2462},
// 	{"bssid":"24:f5:a2:15:8b:1a","ssid":"Linksys01906","freq":-42,"rssi":0,"distance":2462}
// ]

// async function testWifi(){

// 	let c = await utils.Campaign.getOneWifiCampaign(1, '23', wifis);
// 	console.log(JSON.parse(JSON.stringify(c)));
// }

// testWifi();

// const geolib = require('geolib');

// let x = geolib.isPointInCircle({latitude: '19.119896460324526', longitude: '72.91322736069561'}, 
// 	{latitude: '19.1191426148654', longitude: '72.9136388137974'}, '40');

// 19.1191 |     72.9136 |  35.3767

// console.log(x);


const model = require('./models');


async function test(userId) {
	let android = 0;
	let iPhone = 0;
	let x = await model.appuser.findAll({
		attributes: ['id'],
		include:[
			{
				model: model.device,
				attributes: ['GAID'],
				// include: 
				// }
			},
			{
				model: model.application,
				attributes: ['id'],
				where: {
					userId: userId
				}
			}
		]
	});

	x.map(d => {

		let type = d['device']['GAID']

		if(type.includes('Android') || type.includes('android')) {
			android++;
		} else if(type.includes('iPhone')) {
			iPhone++;
		}
	});

	console.log({android, iPhone});

}	

test(1);


// const uuid = require('uuid/v4');


// async function doit(){
// 	await model.appuser.update({ inlocusId: uuid() }, { where: { id: 1 } });
// 	await model.appuser.update({ inlocusId: uuid() }, { where: { id: 2 } });
// 	await model.appuser.update({ inlocusId: uuid() }, { where: { id: 3 } });
// 	await model.appuser.update({ inlocusId: uuid() }, { where: { id: 4 } });
// 	await model.appuser.update({ inlocusId: uuid() }, { where: { id: 5 } });
// }


// doit();