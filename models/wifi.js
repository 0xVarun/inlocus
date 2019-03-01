'use strict';
module.exports = (sequelize, DataTypes) => {
  const wifi = sequelize.define('wifi', {
    macid: DataTypes.STRING,
    ssid: DataTypes.STRING,
    rssi: DataTypes.DOUBLE,
    freq: DataTypes.STRING,
    distance: DataTypes.FLOAT
  }, {});
  wifi.associate = function(models) {
    wifi.belongsTo(models.device, {
      foreignKey: {
        name: 'deviceId',
        allowNull: false
      },
      targetKey: 'id'
    });
  };
  return wifi;
};