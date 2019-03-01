'use strict';
module.exports = (sequelize, DataTypes) => {
  const beacon = sequelize.define('beacon', {
    major: DataTypes.STRING,
    minor: DataTypes.STRING,
    uuid: DataTypes.STRING,
    rssi: DataTypes.DOUBLE,
    distance: DataTypes.FLOAT
  }, {});
  beacon.associate = function(models) {
    beacon.belongsTo(models.device, {
      foreignKey: {
        name: 'deviceId',
        allowNull: false
      },
      targetKey: 'id'
    });
  };
  return beacon;
};