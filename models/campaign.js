'use strict';
module.exports = (sequelize, DataTypes) => {
  const campaign = sequelize.define('campaign', {
    name: DataTypes.STRING,
    title: DataTypes.STRING,
    start_timestamp: DataTypes.DATE,
    end_timestamp: DataTypes.DATE,
    body: DataTypes.STRING,
    content: DataTypes.STRING,
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
  };
  return campaign;
};