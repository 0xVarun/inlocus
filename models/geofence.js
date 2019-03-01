'use strict';
module.exports = (sequelize, DataTypes) => {
  const geofence = sequelize.define('geofence', {
    name: DataTypes.STRING,
  }, {});
  geofence.associate = function(models) {
    geofence.belongsTo(models.user, {
      foreignKey: {
        name: 'userId',
        allowNull: false
      },
      targetKey: 'id'
    });

    geofence.hasMany(models.geolocation)
  };
  return geofence;
};