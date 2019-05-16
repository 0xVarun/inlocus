const model		= require('../models');
const Op		= require('sequelize').Op;

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

module.exports.getUsers = async (userId) => {
	let apps = await model.application.findAll({ 
		where: { 
			userId: {
				[Op.eq]: userId
			} 
		}, 
		include: [
			{
				model:model.appuser, 
				include: {
					model: model.device
				}
			}
		]
	});
	return apps;
}