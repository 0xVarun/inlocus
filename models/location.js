'use strict';
module.exports = (sequelize, DataTypes) => {
  const location = sequelize.define('location', {
    latitude: DataTypes.DOUBLE,
    longitude: DataTypes.DOUBLE,
    userId: {
      type: DataTypes.STRING,
      references: {
        model: 'sdkuser',
        key: 'id',
      },
    },
  }, {});
  location.associate = function(models) {
    // associations can be defined here
    location.hasOne(models.sdkuser, {
    	foreignKey: {
		    name: 'id',
		    allowNull: false
		  }
    });
  };
  return location;
};