#!/usr/bin/env node

const program 	= require('commander');
const model		= require('../models');
const bcrypt	= require('bcryptjs');

function gensaltedhash(password) {
	let salt = bcrypt.genSaltSync(10);
	let hash = bcrypt.hashSync(password, salt);
	return hash;
}

async function createSuperAdminUser( username, password, email, name ) {
	let hash = gensaltedhash(password);
	let user = await model.user.create({ name: name, username: username, email: email, password: hash });
	let roles = await model.roles.create({ superadmin: true, appadmin: false, appstaff: false, advertiser: false, active: true, userId: user.id });

	
}

async function main(){
	program
		.version('0.1.0')
		.option('--env [env]')
		.option('-u, --username [username]')
		.option('-e, --email [email]')
		.option('-n, --name [name]')
		.option('-p, --password [password]')
		.option('-s, --superadmin')
		.option('-a, --appadmin')
		.parse(process.argv);

	if(!program.env) {
		console.log('Please set environment variable, { production, development, staging }')
		process.exit(1);
	}
	process.env.NODE_ENV = program.env;	

	if(program.superadmin) {
		await createSuperAdminUser(program.username, program.password, program.email, program.name)
	}	

}


main();