'use strict';
module.exports = (sequelize, DataTypes) => {
  const wifi = sequelize.define('wifi', {
    macid: DataTypes.STRING,
    ssid: DataTypes.STRING,
    rssi: DataTypes.DOUBLE,
    freq: DataTypes.STRING,
    distance: DataTypes.FLOAT,
    deviceId: {
      type: DataTypes.STRING,
      references: {
        model: 'device',
        key: 'deviceId',
      },
    }
  }, {});
  wifi.associate = function(models) {
    // associations can be defined here
    wifi.hasOne(models.device, {
      foreignKey: {
        name: 'deviceId',
        allowNull: false
    }
    });
  };
  return wifi;
};