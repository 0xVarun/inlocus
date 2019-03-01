const Sequelize 	= require('sequelize');
const dbName		= process.env.DB || 'physdk';
const username		= process.env.DB_USER || 'phypixel';
const password		= process.env.DB_PASS || 'beacon5791';
const host			= process.env.DB_HOST || 'localhost'

// initialize connection
const db			= new Sequelize(dbName, username, password, {
	host: host,
	dialect: 'postgres',
	pool: {
		max: 5,
		min: 0,
		acquire: 30000,
		idle: 10000
	},
	// operatorsAliases: false,
	logging: false
});

db.authenticate()
	.then( () => console.log('connected'))
	.catch( err => { console.log('ERROR: ' + err); });

module.exports = db;