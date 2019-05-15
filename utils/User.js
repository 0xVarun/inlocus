const model		= require('../models');
const bcrypt	= require('bcryptjs');

function gensaltedhash(password) {
	let salt = bcrypt.genSaltSync(10);
	let hash = bcrypt.hashSync(password, salt);
	return hash;
}

module.exports.registerUser = async (name, username, email, password, applicationId) => {
	let hash = gensaltedhash(password);
	let user = await model.user.create({ name: name, username: username, email: email, password: hash });
	let roles = await model.roles.create({ superadmin: false, appadmin: true, appstaff: false, advertiser: false, active: false, userId: user.id });
}

module.exports.registerStaffUser = async function(name, username, email, password, applicationId) {
	let hash = gensaltedhash(password);
	let user = await model.user.create({ name: name, username: username, email: email, password: hash });
	let roles = await model.roles.create({ superadmin: false, appadmin: false, appstaff: true, advertiser: false, active: false, userId: user.id });
}

module.exports.getUserByEmail = function(email, callback) {
	model.user
		.findOne( { where: { email: email }, include: [{ model: model.roles }]} )
		.then( user => { callback(null, user); })
		.catch(err => { callback(err, null) });
}

module.exports.getUserById = function(id, callback) {
	model.user
		.findOne({ where: { id: id }, include: [{ model: model.roles }] })
		.then( user => {callback(null, user);})
		.catch(err => { callback(err, null);});
}

module.exports.findAll = function() {
	return model.user
		.findAll({ include: [ { model: model.application}, {model: model.roles, where: {appstaff: false}} ] })
		.then( user => { return JSON.stringify(user); } )
		.catch( err => { throw err; })
}

module.exports.findStaff = function() {
	return model.user
		.findAll(
			{
				include: [
					{
						model: model.application
					}, 
					{
						model: model.roles,
						attributes: ['superadmin', 'appadmin', 'appstaff', 'active'],
                		where: { 'appstaff': true } 
					} 
				] 
			}
		)
		.then( user => { return JSON.stringify(user); } )
		.catch( err => { throw err; })
}

module.exports.getAll = function(applicationId) {
	return model.user
		.findAll({ where: { applicationId: applicationId }, include: [{ model: model.roles, where: { appadmin: false, superadmin: false }}] })
		.then( user => { return JSON.stringify(user); } )
		.catch( err => { throw err; })
}

module.exports.authenticateUser = async function(password, hash, callback) {
	bcrypt.compare(password, hash, function(err, isMatch) {
		if(err) {
			throw err;
		}
		callback(null, isMatch);
	})
}

module.exports.activateUser = async function(id) {
	return model.user
		.update({ active: true }, { where: { id: id }, returning: true, plain: true });
}

module.exports.deActivateUser = async function(id) {
	return model.user
		.update({ active: false }, { where: { id: id }, returning: true, plain: true });
}

module.exports.mkSuperadmin = function(id) {
	return model.user
		.update({ superadmin: true }, { where: { id: id }, returning: true, plain: true });
}

module.exports.rmSuperadmin = function(id) {
	return model.user
		.update({ superadmin: false }, { where: { id: id }, returning: true, plain: true });
}

module.exports.mkAppAdmin = function(id) {
	return model.user
		.update({ appadmin: true }, { where: { id: id }, returning: true, plain: true });
}

module.exports.rmAppAdmin = function(id) {
	return model.user
		.update({ appadmin: false }, { where: { id: id }, returning: true, plain: true });
}

/*module.exports.mkStaff = function(id) {
	return model.user
		.update({ staff: true }, { where: { id: id }, returning: true, plain: true });
}

module.exports.rmStaff = function(id) {
	return model.user
		.update({ staff: false }, { where: { id: id }, returning: true, plain: true });
}*/

module.exports.removeUser = function(id) {
	return model.user
		.destroy({ where: { id: id } });
}