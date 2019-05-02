'use strict';
module.exports = (sequelize, DataTypes) => {
  const notification = sequelize.define('notification', {
    status: DataTypes.STRING
  }, {});
  notification.associate = function(models) {
    notification.belongsTo(models.device, {
    	foreignKey: {
        name: 'deviceId',
        allowNull: false
      },
      targetKey: 'id'
    });
    notification.belongsTo(models.application, {
    	foreignKey: {
        name: 'applicationId',
        allowNull: false
      },
      targetKey: 'id'
    });
    notification.belongsTo(models.campaign, {
    	foreignKey: {
        name: 'campaignId',
        allowNull: false
      },
      targetKey: 'id'
    });
  };
  return notification;
};