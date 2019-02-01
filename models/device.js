'use strict';
module.exports = (sequelize, DataTypes) => {
  const Device = sequelize.define('Device', {
    IMEI: DataTypes.STRING,
    GAID: DataTypes.STRING,
    deviceId: DataTypes.STRING
  }, {});
  Device.associate = function(models) {
    // associations can be defined here
  };
  return Device;
};