'use strict';
module.exports = (sequelize, DataTypes) => {
  const campaign = sequelize.define('campaign', {
    name: DataTypes.STRING,
    start_timestamp: DataTypes.DATE,
    end_timestamp: DataTypes.DATE,
    content: DataTypes.STRING,
    action: DataTypes.STRING,
    file: DataTypes.STRING
  }, {});
  campaign.associate = function(models) {
    campaign.belongsTo(models.application, {
      foreignKey: {
        name: 'applicationId',
        allowNull: false
      },
      targetKey: 'id'
    });
    campaign.belongsTo(models.location_master, {
        foreignKey: {
            name: 'locationMasterId',
            allowNull: false
        },
        targetKey: 'id'
    })
  };
  return campaign;
};