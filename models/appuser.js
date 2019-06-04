'use strict';
module.exports = (sequelize, DataTypes) => {
  const appuser = sequelize.define('appuser', {
    userId: DataTypes.STRING,
    mobileNo: DataTypes.STRING,
    emailId: DataTypes.STRING,
    inlocusId: DataTypes.STRING
  }, {});
  appuser.associate = function(models) {
    // associations can be defined here
    appuser.belongsTo(models.device, {
    	foreignKey: {
		    name: 'deviceId',
		    allowNull: false
      },
      targetKey: 'id'
    });

    appuser.belongsTo(models.application, {
      foreignKey: {
        name: 'applicationId',
        allowNull: false
      },
      targetKey: 'id'
    })
  };
  return appuser;
};