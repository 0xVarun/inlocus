'use strict';
module.exports = (sequelize, DataTypes) => {
  const geolocation = sequelize.define('geolocation', {
    type: DataTypes.STRING,
    latitude: DataTypes.DOUBLE,
    longitude: DataTypes.DOUBLE,
  }, {});
  geolocation.associate = function(models) {
    geolocation.belongsTo(models.geofence, {
      foreignKey: {
        name: 'geofenceId',
        allowNull: false
      },
      targetKey: 'id'
    })
  };
  return geolocation;
};