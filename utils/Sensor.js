const model		= require('../models');
const sequelize = require('sequelize');
const http		= require('axios');

async function getAddress(lat, lng) {
	let api_key = 'AIzaSyD0awMda5obf1OnLxaJ1gqghu2A19Fr7Bs';
	let url = `https://maps.googleapis.com/maps/api/geocode/json?key=${api_key}&latlng=${lat},${lng}&sensor=true`;
	let res = await http.get(url);
	return res.data.results[0]['formatted_address'];
}

module.exports.saveLocation = async (latitude, longitude, deviceId) => {
	let address = await getAddress(latitude, longitude);
	return model.location.create({ latitude: latitude, longitude: longitude, address: address, deviceId: deviceId })
		.then(location => { return location })
		.catch(err => { throw err });
}

module.exports.saveBeacon = (major, minor, uuid, rssi, distance, deviceId) => {
	return model.beacon.create({ major: major ,minor: minor ,uuid: uuid,rssi: rssi,distance: distance,deviceId: deviceId })
		.then( beacon => { return beacon } )
		.catch( err => { throw err } );
}	

module.exports.getLatestBeacon = async () => {
	let beacon = await model.beacon.findAll({ limit: 1, order: [['createdAt', 'DESC']]});
	if(beacon.length === 0) {
		return '';
	}
	let mbeacon = await model.beacon_master.findOne({ where: { major: beacon[0].major, minor: beacon[0].minor }});
	if(mbeacon) {return mbeacon.shortlink}
	else { return '' };
}

function saveWifi(macId, ssid, rssi, distance, freq, deviceId) {
	return model.wifi.create({macid: macId, ssid: ssid, rssi: rssi, distance: distance, freq: freq, deviceId: deviceId})
		.then( wifi => { return wifi })
		.catch( err => { throw err });
}

module.exports.saveWifi = saveWifi;

module.exports.saveMultiWifi = (payload, deviceId) => {
	let returnValue = payload.map(async load => {
		let data = await saveWifi(load["bssid"], load["ssid"], load["rssi"], load["distance"], load["freq"], deviceId);
		return data;
	});
	return returnValue;
};

module.exports.countByHour = () => {
	return model.location.findAll({
		limit: 7,
		attributes: [
			[sequelize.literal(`DATE("createdAt")`), 'date'],
			[sequelize.literal(`COUNT(*)`), 'count']
		],
		group: ['date'],
		order: [[sequelize.literal(`DATE("createdAt")`), 'ASC']]
	})
		.then( data => { return data; })
		.catch( err => { return {err}; })
}

module.exports.getDeviceCount = async (userId) => {
	let android = 0;
	let iPhone = 0;

	let x = await model.appuser.findAll({
		attributes: ['id'],
		include:[
			{
				model: model.device,
				attributes: ['GAID'],
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
	return { android, iPhone };
}


module.exports.getLatestLocation = async () => {
	let beacon = await model.location.findAll({ limit: 1, order: [['createdAt', 'DESC']]});
	if(beacon.length === 0) {
		return '';
	}
	return `${beacon[0].latitude}, ${beacon[0].longitude}` 
}