'use strict';
module.exports = (sequelize, DataTypes) => {
  const roles = sequelize.define('roles', {
    superadmin: DataTypes.BOOLEAN,
    appadmin: DataTypes.BOOLEAN,
    appstaff: DataTypes.BOOLEAN,
    advertiser: DataTypes.BOOLEAN,
    active: DataTypes.BOOLEAN
  }, {});
  roles.associate = function(models) {
    roles.belongsTo(models.user, {
      foreignKey: {
        name: 'userId',
        allowNull: false
      },
      targetKey: 'id'
    });
  };
  return roles;
};