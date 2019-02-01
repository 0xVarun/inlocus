const db		= require('../db/postgres');
const model		= require('../models');

/**
 * Register a new Device
 *
 * @param      String  imei      device imei
 * @param      String  gaid      device gaid
 * @param      String  deviceId  device identifier
 * @return     deviceId / Err    device id in DB or Error
 */
module.exports.registerDevice = function(imei, gaid, deviceId) {
	return model.device.create({ IMEI: imei, GAID: gaid, deviceId: deviceId })
		.then( device => { return device })
		.catch( err => { throw err; })
};


/**
 * Returns all devices 
 */
module.exports.findAllDevices = function() {
	return model.device.findAll()
		.then(devices => { return devices; })
		.catch(err => { throw err; });
}