'use strict';

const fs = require('fs');
const path = require('path');
const Sequelize = require('sequelize');
const basename = path.basename(__filename);
const env = process.env.ENV || 'development';
const config = require(__dirname + '/../config/config.json')[env];


let sequelize;
if (config.use_env_variable) {
  sequelize = new Sequelize(process.env[config.use_env_variable], config);
} else {
  sequelize = new Sequelize(config.database, config.username, config.password, config);
}

const db = {
  application: sequelize.import('./application'),
  user: sequelize.import('./user'),
  device: sequelize.import('./device'),
  appuser: sequelize.import('./appuser'),
  beacon: sequelize.import('./beacon'),
  wifi: sequelize.import('./wifi'),
  location: sequelize.import('./location'),
  geofence: sequelize.import('./geofence'),
  geolocation: sequelize.import('./geolocation')
};


Object.keys(db).forEach(modelName => {
  if (db[modelName].associate) {
    db[modelName].associate(db);
  }
});

db.sequelize = sequelize;
db.Sequelize = Sequelize;

module.exports = db;
