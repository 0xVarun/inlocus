const db		= require('../db/postgres');
const model		= require('../models');
const bcrypt	= require('bcryptjs');

function gensaltedhash(password) {
	let salt = bcrypt.genSaltSync(10);
	let hash = bcrypt.hashSync(password, salt);
	return hash;
}

module.exports.registerUser = function(name, username, email, password) {
	let hash = gensaltedhash(password);
	return model.user.create({ name: name, username: username, email: email, password: hash, active: false })
		.then( user => { return user; })
		.catch( err => { throw err; });
}

module.exports.getUserByEmail = function(email, callback) {
	model.user
		.findOne( { where: { email: email }} )
		.then( user => { callback(null, user); })
		.catch(err => { callback(err, null) });
}

module.exports.getUserById = function(id, callback) {
	model.user
		.findByPk( id )
		.then( user => {callback(null, user);})
		.catch(err => { callback(err, null);});
}

module.exports.authenticateUser = async function(password, hash, callback) {
	bcrypt.compare(password, hash, function(err, isMatch) {
		if(err) {
			throw err;
		}
		callback(null, isMatch);
	})
}