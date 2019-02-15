const db		= require('../db/postgres');
const model		= require('../models');

module.exports.registerAppUser = function(userId, mobileNo, emailId, deviceId, appId) {
	return model.sdkuser.create({ userId: userId, mobileNo: mobileNo, emailId: emailId, deviceId: deviceId, appId: appId })
			.then( appUser => { 
				let device = model.device.find
				return appUser; 
			})
			.catch( err => { throw err; });
} 

module.exports.getUserById = function(userId) {
	return model.sdkuser
		.findByPk( userId )
		.then( user => {return user;})
		.catch(err => { throw err;});
}

module.exports.updateAppUser = function(appUser){

}
