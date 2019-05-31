'use strict';
module.exports = (sequelize, DataTypes) => {
  const location = sequelize.define('location', {
    latlng: DataTypes.GEOMETRY,
    address: DataTypes.STRING
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