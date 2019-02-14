'use strict';
module.exports = (sequelize, DataTypes) => {
  const staff = sequelize.define('staff', {
    username: DataTypes.STRING,
    emailId: DataTypes.STRING,
    name: DataTypes.STRING,
    password: DataTypes.STRING,
    active: DataTypes.BOOLEAN,
    appId: {
      type: DataTypes.INTEGER,
      references: {
        model: 'application',
        key: 'id'
      }
    }
  }, {});
  staff.associate = function(models) {
    // associations can be defined here
    staff.hasOne(models.application, {
      foreignKey: {
        name: 'id',
        allowNull: false
      }
    })
  };
  return staff;
};