'use strict';
module.exports = (sequelize, DataTypes) => {
  const location = sequelize.define('location', {
    latitude: DataTypes.DOUBLE,
    longitude: DataTypes.DOUBLE,
    address: DataTypes.STRING,
    geometry: DataTypes.GEOMETRY
  }, {});
  location.associate = function(models) {
    location.belongsTo(models.device, {
    	foreignKey: {
        name: 'deviceId',
        allowNull: false
      },
      targetKey: 'id'
    });
  };
  return location;
};