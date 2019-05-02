'use strict';
module.exports = (sequelize, DataTypes) => {
  const campaign = sequelize.define('campaign', {
    name: DataTypes.STRING,
    title: DataTypes.STRING,
    start_timestamp: DataTypes.DATE,
    end_timestamp: DataTypes.DATE,
    body: DataTypes.STRING,
    action: DataTypes.STRING,
    type: DataTypes.STRING
  }, {});
  campaign.associate = function(models) {
    campaign.belongsTo(models.application, {
      foreignKey: {
        name: 'applicationId',
        allowNull: false
      },
      targetKey: 'id'
    });
    campaign.belongsTo(models.user, {
      foreignKey: {
        name: 'userId',
        allowNull: false
      },
      targetKey: 'id'
    });
    campaign.belongsTo(models.content, {
      foreignKey: {
        name: 'contentId',
        allowNull: true
      },
      targetKey: 'id'
    });
    campaign.hasMany(models.CampaignLocation);
    campaign.hasMany(models.notify);
  };
  return campaign;
};