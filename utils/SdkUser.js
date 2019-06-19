const model		= require('../models');
const Op		= require('sequelize').Op;
const inlocusId	= require('uuid/v4');


/**
 * Register New App User
 *
 * @param      {String}  userId    The user identifier
 * @param      {String}  mobileNo  The mobile no
 * @param      {String}  emailId   The email identifier
 * @param      {Number}  deviceId  The device identifier
 * @param      {Number}  appId     The application identifier
 * @return     {Object}  Registered App User
 */
module.exports.registerAppUser = function(userId, mobileNo, emailId, deviceId, appId) {
	return model.appuser.create({ userId: userId, mobileNo: mobileNo, emailId: emailId, deviceId: deviceId, applicationId: appId, inlocusId: inlocusId() })
			.then( appUser => { 
				let device = model.device.find
				return appUser; 
			})
			.catch( err => { throw err; });
} 


/**
 * Gets the user by identifier.
 *
 * @param      {Number}  userId  The user identifier
 * @return     {Object}  The user by identifier.
 */
module.exports.getUserById = function(userId) {
	return model.appuser
		.findByPk( userId )
		.then( user => {return user;})
		.catch(err => { throw err;});
}


/**
 * Gets the user by inlocus identifier.
 *
 * @param      {String}  inlocusId  The inlocus identifier
 * @return     {Object}  The user by inlocus identifier.
 */
module.exports.getUserByInlocusId = async (inlocusId) => {
	return await model.appuser.findOne({ where: { inlocusId: { [Op.eq]: inlocusId } } });
}


/**
 * Updates App User
 *
 * @param      {Number}  id       The identifier
 * @param      {Object}  appUser  The application user
 */
module.exports.updateAppUser = function(id,appUser){

}


/**
 * Gets the users.
 *
 * @param      {String}  userId  The user identifier
 * @return     {Object}  The users.
 */
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