'use strict';
module.exports = (sequelize, DataTypes) => {
  const wifi_master = sequelize.define('wifi_master', {
    bssid: DataTypes.STRING,
    ssid: DataTypes.STRING,
    rssi: DataTypes.DOUBLE
  }, {});
  wifi_master.associate = function(models) {
    wifi_master.belongsTo(models.location_master, {
      foreignKey: {
        name: 'locationMasterId',
        allowNull: false
      },
      targetKey: 'id'
    });
  };
  return wifi_master;
};