'use strict';
module.exports = (sequelize, DataTypes) => {
  const tags = sequelize.define('location_tags', {
    tag: DataTypes.STRING
  }, {});
  tags.associate = function(models) {
    tags.belongsTo(models.location_master, {
        foreignKey: {
            name: 'locationMasterId',
            allowNull: false
      },
      targetKey: 'id'
    });
  };
  return tags;
};