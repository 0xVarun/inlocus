'use strict';
module.exports = (sequelize, DataTypes) => {
  const notification_address = sequelize.define('notification_address', {
    country: DataTypes.STRING,
    city: DataTypes.STRING,
  }, {});
  notification_address.associate = function(models) {
    notification_address.belongsTo(models.campaign, {
      foreignKey: {
        name: 'campaignId',
        allowNull: false
      },
      targetKey: 'id'
    });

    notification_address.belongsTo(models.notify, {
        foreignKey: {
          name: 'notificationId',
          allowNull: false
        },
        targetKey: 'id'
      });
  };
  return notification_address;
};