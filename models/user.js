'use strict';
module.exports = (sequelize, DataTypes) => {
  const user = sequelize.define('user', {
    name: DataTypes.STRING,
    username: DataTypes.STRING,
    email: DataTypes.STRING,
    password: DataTypes.STRING,
    active: DataTypes.BOOLEAN,
    superadmin: DataTypes.BOOLEAN,
    appId: {
      type: DataTypes.INTEGER,
      references: {
        model: 'application',
        key: 'id'
      }
    }
  }, {});
  user.associate = function(models) {
    // associations can be defined here
    user.hasOne(models.application, {
      foreignKey: {
        name: 'id',
        allowNull: false
      }
    })
  };
  return user;
};