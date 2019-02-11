'use strict';
module.exports = (sequelize, DataTypes) => {
  const sdkuser = sequelize.define('sdkuser', {
    userId: DataTypes.STRING,
    mobileNo: DataTypes.STRING,
    deviceId: {
      type: DataTypes.STRING,
      references: {
        model: 'device',
        key: 'deviceId',
      },
    },
    appId: {
      type: DataTypes.INTEGER,
      references: {
        model: 'application',
        key: 'id'
      }
    },
    emailId: DataTypes.STRING
  }, {});
  sdkuser.associate = function(models) {
    // associations can be defined here
    sdkuser.hasOne(models.device, {
    	foreignKey: {
		    name: 'deviceId',
		    allowNull: false
		  }
    });

    sdkuser.hasOne(models.application, {
      foreignKey: {
        name: 'id',
        allowNull: false
      }
    })
  };
  return sdkuser;
};