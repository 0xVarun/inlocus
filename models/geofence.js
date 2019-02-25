'use strict';
module.exports = (sequelize, DataTypes) => {
  const geofence = sequelize.define('geofence', {
    name: DataTypes.STRING,
    userId: {
      type: DataTypes.INTEGER,
      references: {
        model: 'user',
        key: 'id',
      },
    }
  }, {});
  geofence.associate = function(models) {
    geofence.hasOne(models.user, {
      foreignKey: {
        name: 'id',
        allowNull: false
      },
    });

    geofence.hasMany(models.geoloc, { foreignKey: 'geofenceId' })
  };
  return geofence;
};