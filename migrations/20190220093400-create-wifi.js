'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('wifis', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      macid: {
        type: Sequelize.STRING
      },
      ssid: {
        type: Sequelize.STRING
      },
      rssi: {
        type: Sequelize.DOUBLE
      },
      freq: {
        type: Sequelize.STRING
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
    return queryInterface.dropTable('wifis');
  }
};