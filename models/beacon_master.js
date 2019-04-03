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
    public: DataTypes.BOOLEAN,
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
    beacon_master.hasMany(models.tags);
  };
  return beacon_master;
};