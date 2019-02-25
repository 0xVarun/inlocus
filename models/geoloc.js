'use strict';
module.exports = (sequelize, DataTypes) => {
  const geoloc = sequelize.define('geoloc', {
    latitude: DataTypes.DOUBLE,
    longitude: DataTypes.DOUBLE,
    geofenceId: {
      type: DataTypes.STRING,
      references: {
        model: 'geofence',
        key: 'id',
      },
    }
  }, {});
  geoloc.associate = function(models) {
    // associations can be defined here
    geoloc.belongsTo(models.geofence, {
      foreignKey: {
        name: 'id',
        allowNull: false
      },
    })
  };
  return geoloc;
};