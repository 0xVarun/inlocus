'use strict';
module.exports = (sequelize, DataTypes) => {
  const beacon_master = sequelize.define('beacon_master', {
    major: {
        type: DataTypes.STRING,
        unique: true
    },
    minor: {
        type: DataTypes.STRING,
        unique: true
    },
    shortlink: {
        type: DataTypes.STRING,
        unique: true
    },
    uuid: {
        type: DataTypes.STRING
    }
  }, {});
  beacon_master.associate = function(models) {
    beacon_master.belongsTo(models.location_master, {
        foreignKey: {
            name: 'locationMasterId',
            allowNull: false
      },
      targetKey: 'id'
    });
  };
  return beacon_master;
};