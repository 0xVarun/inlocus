const model		= require('../models');
const Op 		= require('sequelize').Op;


/**
 * Registes a new Application
 *
 * @param      {String}  	name        The name of the application
 * @param      {String}  	url         The url of the application ( Callback Url )
 * @param      {String}  	key         API key ( unique to application )
 * @param      {String}  	secret      API Secret ( unique to application )
 * @param      {Boolean}  	approved    Is the application approved for campagin creation ( default: false )
 * @param      {String}  	category    The category Of the Application
 * @param      {Boolean}  	production  The production
 * @param      {Integer}  	userid      The userid
 * @return     {Application / Error} 	Returns the newly created application OR Error 
 */
module.exports.registerApplication = (name, url, key, secret, approved, category, production, userid) => {
	model.application.create({ 
		name: name, 
		url: url, 
		API_KEY: key, 
		API_SECRET: secret, 
		approved: approved, 
		category: category, 
		production: production, 
		userId: userid 
	})
		.then(app => { return app; })
		.catch(err => { throw err; });
}


/**
 * Change Application status (Production, Development)
 *
 * @param      {Boolean}  	production  Signifies if the application is in production
 *                                     	or development
 * @param      {Integer}  	userId      The user identifier
 * @param      {Integer}  	appId       The application identifier
 * @return     {Application}  			Returns the newly created application
 */
module.exports.update = (production, userId, appId) => {
	return model.application
		.update({ 
			production: production 
		}, { 
			where: { 
				id: {
					[Op.eq]: appId
				}, 
				userId: {
					[Op.eq]: userId
				} 
			}, 
			returning: true, 
			plain: true
		})
}


/**
 * Returns all application ( Superadmin only )
 *
 * @return     {Array}  Array of all applications
 */
module.exports.findAll = function() {
	return model.application.findAll()
		.then(apps => { return apps; })
		.catch(err => { throw err; });
}


/**
 * Retuns all apps created by a user
 *
 * @param      {Integer}  id      	The user identifier
 * @return     {Array}  			Array of all applications created by the user
 */
module.exports.findAllUserApps = (id) => {
	return model.application.findAll({ where: { 'userId': id } })
		.then(apps => { return apps; })
		.catch(err => { throw err; });
}


/**
 * Retuns all applications that have been approved
 * 
 * @param      {Integer}  id      The user identifier
 * @return     {Array}  Returns all user apps that have been approved
 */
module.exports.findAllUserApprovedApps = (id) => {
	return model.application.findAll({ where: { 'userId': id } })
		.then(apps => { return apps; })
		.catch(err => { throw err; });
}


/**
 * Returns one application 
 *
 * @param      {Integer}  userId  The user identifier
 * @param      {Integer}  id      The application identifier
 * @return     {JSON / Error}  returns the application or Error
 */
module.exports.findOneApp = (userId, id) => {
	return model.application.findOne({ where: { 'userId': userId, 'id': id} })
		.then(app => { return app; })
		.catch(err => { throw err; });
}


/**
 * Determines if application is active.
 *
 * @param      {String}   key     The API key
 * @param      {String}   secret  The API secret
 * @return     {boolean}  True if active, False otherwise.
 */
module.exports.isActive = function(key, secret) {
	return model.application
		.findOne({ where: { API_KEY: key, API_SECRET: secret } })
		.then( app => { if( app.approved ) return true; else return false })
		.catch(err => { return err });
}


/**
 * Gets the application identifier.
 *
 * @param      {String}  key     The API key
 * @return     {Integer}  The application id.
 */
module.exports.getAppId = function(key) {
	return model.application
		.findOne({ where: { API_KEY: key }})
		.then( app => { return app.id })
		.catch(err => { throw err; });
}


/**
 * Gets the application name.
 *
 * @param      {Integer}  id      The identifier
 * @return     {String}  The application name.
 */
module.exports.getAppName = function(id) {
	return model.application
		.findByPk(id)
		.then( app => { return app.name })
		.catch(err => { throw err; });
}