const db		= require('../db/postgres');
const model		= require('../models');

module.exports.registerAppUser = function(userId, mobileNo, emailId, deviceId) {
	return model.sdkuser.create({ userId: userId, mobileNo: mobileNo, emailId: emailId })
			.then( appUser => { 
				let device = model.device.find
				return appUser; 
			})
			.catch( err => { throw err; });
} 

module.exports.updateAppUser = function(appUser){

}
