const db		= require('../db/postgres');
const model		= require('../models');


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

module.exports.getLatestBeacon = () => {
	return model.beacon.findAll({ limit: 1, order: [['createdAt', 'DESC']]})
		.then(beacon => { return beacon })
		.catch(err => { return {err} })
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