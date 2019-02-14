'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('applications', [{
      id: 1,
      name: "inLocus",
      API_KEY: "KHK9J4K-AGQ4BY7-K94B4G8-WQTFWGJ",
      API_SECRET: "9c669912-542e-45f8-9a48-b241e5f4fe42",
      active: true,
      cactive: true,
      createdAt: new Date(),
      updatedAt: new Date()
    }], {})
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('applications', null, {});
  }
};
