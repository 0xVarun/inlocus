'use strict';
module.exports = (sequelize, DataTypes) => {
  const campaign_location = sequelize.define('campaign_location', {
    
  }, {});
  campaign_location.associate = function(models) {
    campaign_location.belongsTo(models.campaign, {
      foreignKey: {
        name: 'campaignId',
        allowNull: false
      },
      targetKey: 'id'
    });
    campaign_location.belongsTo(models.location_master, {
        foreignKey: {
          name: 'locationMasterId',
          allowNull: false
        },
        targetKey: 'id'
      });
  };
  return campaign_location;
};