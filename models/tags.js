'use strict';
module.exports = (sequelize, DataTypes) => {
  const tags = sequelize.define('tags', {
    tag: DataTypes.STRING,
    type: DataTypes.STRING
  }, {});
  tags.associate = function(models) {
    tags.belongsTo(models.beacon_master, {
        foreignKey: {
            name: 'beaconMasterId',
            allowNull: true
      },
      targetKey: 'id'
    });
    tags.belongsTo(models.location_master, {
        foreignKey: {
            name: 'locationMasterId',
            allowNull: true
      },
      targetKey: 'id'
    });
    tags.belongsTo(models.user, {
        foreignKey: {
            name: 'userId',
            allowNull: false
        },
        targetKey: 'id'
    });
  };
  return tags;
};