const db		= require('../db/postgres');
const model		= require('../models');

module.exports.registerApplication = function(name, api_key, api_secret) {
	model.application.create({name: name, API_KEY: api_key, API_SECRET: api_secret,active: false,cactive: false})
		.then(app => { return app; })
		.catch(err => { throw err; });
}

module.exports.findAll = function() {
	return model.application.findAll()
		.then(apps => { return apps; })
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