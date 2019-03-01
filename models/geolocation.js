'use strict';
module.exports = (sequelize, DataTypes) => {
  const geoloc = sequelize.define('geolocation', {
    latitude: DataTypes.DOUBLE,
    longitude: DataTypes.DOUBLE,
  }, {});
  geoloc.associate = function(models) {
    // associations can be defined here
    geoloc.belongsTo(models.geofence, {
      foreignKey: {
        name: 'geofenceId',
        allowNull: false
      },
      targetKey: 'id'
    })
  };
  return geoloc;
};