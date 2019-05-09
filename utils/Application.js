const model		= require('../models');

module.exports.registerApplication = (name, url, key, secret, approved, category, production, userid) => {
	model.application.create({ name: name, url: url, API_KEY: key, API_SECRET: secret, approved: approved, category: category, production: production, userId: userid })
		.then(app => { return app; })
		.catch(err => { throw err; });
}

module.exports.update = (production, userId, appId) => {
	return model.application
		.update({ production: production }, { where: { id: appId, userId: userId }, returning: true, plain: true})
}

module.exports.findAll = function() {
	return model.application.findAll()
		.then(apps => { return apps; })
		.catch(err => { throw err; });
}

module.exports.findAllUserApps = (id) => {
	return model.application.findAll({ where: { 'userId': id } })
		.then(apps => { return apps; })
		.catch(err => { throw err; });
}

module.exports.findAllUserApprovedApps = (id) => {
	return model.application.findAll({ where: { 'userId': id } })
		.then(apps => { return apps; })
		.catch(err => { throw err; });
}

module.exports.findOneApp = (userId, id) => {
	return model.application.findOne({ where: { 'userId': userId, 'id': id} })
		.then(app => { return app; })
		.catch(err => { throw err; });
}

module.exports.activateApp = async function(id) {
	return model.application
		.update({ active: true }, { where: { id: id }, returning: true, plain: true });
}

module.exports.deactivateApp = async function(id) {
	return model.application
		.update({ active: false }, { where: { id: id }, returning: true, plain: true });
}

module.exports.mkCampaignReady = function(id) {
	return model.application
		.update({ cactive: true }, { where: { id: id }, returning: true, plain: true });
}

module.exports.rmCampaignReady = function(id) {
	return model.application
		.update({ cactive: false }, { where: { id: id }, returning: true, plain: true });
}

module.exports.isActive = function(key, secret) {
	return model.application
		.findOne({ where: { API_KEY: key, API_SECRET: secret } })
		.then( app => { if( app.approved ) return true; else return false })
		.catch(err => { return err });
}

module.exports.getAppId = function(key) {
	return model.application
		.findOne({ where: { API_KEY: key }})
		.then( app => { return app.id })
		.catch(err => { throw err; });
}

module.exports.getAppName = function(id) {
	return model.application
		.findByPk(id)
		.then( app => { return app.name })
		.catch(err => { throw err; });
}