'use strict';
module.exports = (sequelize, DataTypes) => {
  const application = sequelize.define('application', {
    name: DataTypes.STRING,
    API_KEY: DataTypes.STRING,
    API_SECRET: DataTypes.STRING,
    active: DataTypes.BOOLEAN,
    cactive: DataTypes.BOOLEAN
  }, {});
  application.associate = function(models) {
    application.hasMany(models.user)
    application.hasMany(models.appuser)
  };
  return application;
};