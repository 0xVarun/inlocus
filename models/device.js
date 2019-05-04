'use strict';
module.exports = (sequelize, DataTypes) => {
  const device = sequelize.define('device', {
    IMEI: DataTypes.STRING,
    GAID: DataTypes.STRING,
    deviceId: DataTypes.STRING
  }, {});
  device.associate = function(models) {
    device.hasMany(models.appuser);
    device.hasMany(models.beacon);
    device.hasMany(models.wifi);
    device.hasMany(models.location);
    device.hasMany(models.notify);
    // device.hasMany(models.beacon);
  };
  return device;
};