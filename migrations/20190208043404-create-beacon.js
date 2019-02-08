'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('Beacons', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      major: {
        type: Sequelize.STRING
      },
      minor: {
        type: Sequelize.STRING
      },
      uuid: {
        type: Sequelize.STRING
      },
      rssi: {
        type: Sequelize.DOUBLE
      },
      distance: {
        type: Sequelize.FLOAT
      },
      deviceId: {
        type: Sequelize.STRING,
        references: {
          model: 'devices', 
          key: 'deviceId', 
        },
        onUpdate: 'CASCADE',
        onDelete: 'SET NULL',
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('Beacons');
  }
};