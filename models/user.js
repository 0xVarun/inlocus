'use strict';
module.exports = (sequelize, DataTypes) => {
  const user = sequelize.define('user', {
    name: DataTypes.STRING,
    username: DataTypes.STRING,
    email: DataTypes.STRING,
    password: DataTypes.STRING,
    active: DataTypes.BOOLEAN,
    superadmin: DataTypes.BOOLEAN,
    appadmin: DataTypes.BOOLEAN,
    staff: DataTypes.BOOLEAN
  }, {});
  user.associate = function(models) {
    // associations can be defined here
    user.belongsTo(models.application, {
      foreignKey: {
        name: 'applicationId',
        allowNull: false
      },
      targetKey: 'id'
    });
    user.hasMany(models.geolocation)
  };
  return user;
};