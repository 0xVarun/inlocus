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


const utils = require('./utils');

const wifis = [
	{"bssid":"14:1f:ba:74:73:08","ssid":"Joispot-wifi","freq":-42,"rssi":0,"distance":2462},
	{"bssid":"78:32:1b:9a:e5:90","ssid":"Osmos","freq":-42,"rssi":0,"distance":2462},
	{"bssid":"24:f5:a2:15:8b:1a","ssid":"Linksys01906","freq":-42,"rssi":0,"distance":2462}
]

async function testWifi(){

	let c = await utils.Campaign.getOneWifiCampaign(1, '23', wifis);
	console.log(JSON.parse(JSON.stringify(c)));
}

testWifi();