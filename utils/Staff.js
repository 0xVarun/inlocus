const db		= require('../db/postgres');
const model		= require('../models');
const bcrypt	= require('bcryptjs');

function gensaltedhash(password) {
	let salt = bcrypt.genSaltSync(10);
	let hash = bcrypt.hashSync(password, salt);
	return hash;
}

module.exports.registerUser = function(name, username, email, password, appId) {
	let hash = gensaltedhash(password);
	return model.staff.create({ username: username , emailId: email, name: name, password: hash, active: true, appId: appId })
		.then( user => { return user; })
		.catch( err => { throw err; });
}

module.exports.getUserByEmail = function(email, callback) {
	model.staff
		.findOne( { where: { email: email }} )
		.then( user => { callback(null, user); })
		.catch(err => { callback(err, null) });
}

module.exports.getUserById = function(id, callback) {
	model.staff
		.findByPk( id )
		.then( user => {callback(null, user);})
		.catch(err => { callback(err, null);});
}

module.exports.getAll = function(appId) {
	return model.staff
		.findAll({ appId: appId })
		.then( staffuser => { return JSON.stringify(staffuser); } )
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
	return model.staff
		.update({ active: true }, { where: { id: id }, returning: true, plain: true });
}

module.exports.deActivateUser = async function(id) {
	return model.staff
		.update({ active: false }, { where: { id: id }, returning: true, plain: true });
}
