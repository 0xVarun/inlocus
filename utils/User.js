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
	return model.user.create({ name: name, username: username, email: email, password: hash })
		.then( user => { return user; })
		.catch( err => { throw err; });
}

function getUserByEmail (email) {
	model
		.find( { where: { email: email }} )
		.then( user => {return user;})
		.catch(err => { throw err;});
}

module.exports.authenticateUser = function(email, password) {
	let user = getUserByEmail(email);
	if(user === null) {
		return false;
	}
	bcrypt.compare(password, user.password, function(err, isMatch) {
		if(err) {
			throw err;
		}
		return isMatch;
	})
}