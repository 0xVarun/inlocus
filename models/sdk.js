'use strict';
module.exports = (sequelize, DataTypes) => {
  const sdk = sequelize.define('sdk', {
    sdk_path: DataTypes.STRING
  }, {});
  sdk.associate = function(models) {
    sdk.belongsTo(models.user, {
      foreignKey: {
        name: 'userId',
        allowNull: false
      },
      targetKey: 'id'
    });
  };
  return sdk;
};