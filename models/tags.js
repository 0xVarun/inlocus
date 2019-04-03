'use strict';
module.exports = (sequelize, DataTypes) => {
  const tags = sequelize.define('tags', {
    tag: DataTypes.STRING
  }, {});
  tags.associate = function(models) {
    tags.belongsTo(models.beacon_master, {
        foreignKey: {
            name: 'beaconMasterId',
            allowNull: false
      },
      targetKey: 'id'
    });
  };
  return tags;
};