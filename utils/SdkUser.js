const db		= require('../db/postgres');
const model		= require('../models');

module.exports.registerAppUser = function(userId, mobileNo, emailId, deviceId, appId) {
	return model.appuser.create({ userId: userId, mobileNo: mobileNo, emailId: emailId, deviceId: deviceId, applicationId: appId })
			.then( appUser => { 
				let device = model.device.find
				return appUser; 
			})
			.catch( err => { throw err; });
} 

module.exports.getUserById = function(userId) {
	return model.appuser
		.findByPk( userId )
		.then( user => {return user;})
		.catch(err => { throw err;});
}

module.exports.updateAppUser = function(appUser){

}
