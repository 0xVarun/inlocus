'use strict';
module.exports = (sequelize, DataTypes) => {
  const sdkuser = sequelize.define('sdkuser', {
    userId: DataTypes.STRING,
    mobileNo: DataTypes.STRING,
    emailId: DataTypes.STRING
  }, {});
  sdkuser.associate = function(models) {
    // associations can be defined here
    sdkuser.hasOne(models.device, {
    	foreignKey: {
		    name: 'deviceId',
		    allowNull: false
		}
    })
  };
  return sdkuser;
};