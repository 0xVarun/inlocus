'use strict';
module.exports = (sequelize, DataTypes) => {
  const location_master = sequelize.define('location_master', {
    name: DataTypes.STRING,
    type: DataTypes.STRING
  }, {});
  location_master.associate = function(models) {
    location_master.hasMany(models.campaign);
    location_master.hasMany(models.beacon_master);
    location_master.hasMany(models.tags);
  };
  return location_master;
};