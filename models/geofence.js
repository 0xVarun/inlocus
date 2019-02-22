'use strict';
module.exports = (sequelize, DataTypes) => {
  const geofence = sequelize.define('geofence', {
    name: DataTypes.STRING,
    userId: {
      type: DataTypes.STRING,
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
    })
  };
  return geofence;
};