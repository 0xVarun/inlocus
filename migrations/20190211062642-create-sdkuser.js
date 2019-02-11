'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('sdkusers', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      userId: {
        unique: true,
        type: Sequelize.STRING
      },
      mobileNo: {
        unique: true,
        type: Sequelize.STRING
      },
      emailId: {
        unique: true,
        type: Sequelize.STRING
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
      appId: {
        type: Sequelize.INTEGER,
        references: {
          model: 'applications', 
          key: 'id', 
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
    return queryInterface.dropTable('sdkusers');
  }
};