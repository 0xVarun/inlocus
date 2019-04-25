'use strict';
module.exports = (sequelize, DataTypes) => {
  const content = sequelize.define('content', {
    name: DataTypes.STRING,
    path: DataTypes.STRING,
    url: DataTypes.STRING
  }, {});
  content.associate = function(models) {
    content.belongsTo(models.user, {
      foreignKey: {
        name: 'userId',
        allowNull: false
      },
      targetKey: 'id'
    });
  };
  return content;
};