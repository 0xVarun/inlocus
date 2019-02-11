'use strict';
module.exports = (sequelize, DataTypes) => {
  const Beacon = sequelize.define('beacon', {
    major: DataTypes.STRING,
    minor: DataTypes.STRING,
    uuid: DataTypes.STRING,
    rssi: DataTypes.DOUBLE,
    distance: DataTypes.FLOAT,
    deviceId: {
      type: DataTypes.STRING,
      references: {
        model: 'device',
        key: 'deviceId',
      },
    }
  }, {});
  Beacon.associate = function(models) {
    // associations can be defined here
    Beacon.hasOne(models.device, {
      foreignKey: {
        name: 'deviceId',
        allowNull: false
    }
    })
  };
  return Beacon;
};