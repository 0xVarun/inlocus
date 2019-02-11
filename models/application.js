'use strict';
module.exports = (sequelize, DataTypes) => {
  const Application = sequelize.define('application', {
    name: DataTypes.STRING,
    API_KEY: DataTypes.STRING,
    API_SECRET: DataTypes.STRING,
    active: DataTypes.BOOLEAN,
    cactive: DataTypes.BOOLEAN
  }, {});
  Application.associate = function(models) {
    // associations can be defined here
  };
  return Application;
};