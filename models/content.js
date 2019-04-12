'use strict';
module.exports = (sequelize, DataTypes) => {
  const content = sequelize.define('content', {
    name: DataTypes.STRING,
    path: DataTypes.STRING,
    url: DataTypes.STRING
  }, {});
  content.associate = function(models) {
    content.hasMany(models.campaign);
  };
  return content;
};