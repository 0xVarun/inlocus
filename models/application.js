'use strict';
module.exports = (sequelize, DataTypes) => {
  const application = sequelize.define('application', {
    name: DataTypes.STRING,
    url: DataTypes.STRING,
    API_KEY: DataTypes.STRING,
    API_SECRET: DataTypes.STRING,
    approved: DataTypes.BOOLEAN,
    category: DataTypes.STRING,
    production: DataTypes.BOOLEAN
  }, {});
  application.associate = function(models) {
    application.belongsTo(models.user, {
      foreignKey: {
        name: 'userId',
        allowNull: false
      },
      targetKey: 'id'
    });
    application.hasMany(models.appuser);
    application.hasMany(models.campaign);
    application.hasMany(models.notify);
  };
  return application;
};