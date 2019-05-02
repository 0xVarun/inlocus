const db		= require('../db/postgres');
const model		= require('../models');
const sequelize = require('sequelize');


module.exports.saveLocation = (latitude, longitude, deviceId) => {
	return model.location.create({ latitude: latitude, longitude: longitude, deviceId: deviceId })
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
		// attributes: [
		// 	[ sequelize.fn('date_trunc', '	', sequelize.col('createdAt')), 'hour'],
    	// 	[ sequelize.fn('count', '*'), 'count']
		// ],
		// group: 'hour'
		attributes: [
			[sequelize.literal(`DATE("createdAt")`), 'date'],
			[sequelize.literal(`COUNT(*)`), 'count']
		],
		group: ['date'],
	})
		.then( beacons => { return beacons; })
		.catch( err => { return {err}; })
}