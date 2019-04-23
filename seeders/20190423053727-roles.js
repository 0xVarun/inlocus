'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    /*
      Add altering commands here.
      Return a promise to correctly handle asynchronicity.

      Example:
      return queryInterface.bulkInsert('People', [{
        name: 'John Doe',
        isBetaMember: false
      }], {});
    */
    return queryInterface.bulkInsert('roles', [{
      id: 1,
      superadmin: true,                                                                         
      appadmin: true,                                                                           
      appstaff: false,                                                                           
      advertiser: false,                                                                         
      active: true,                                                                             
      createdAt: new Date(),                                              
      updatedAt: new Date(),                                              
      userId: 1
    },
    {
      id: 2,
      superadmin: false,                                                                         
      appadmin: true,                                                                           
      appstaff: false,                                                                           
      advertiser: false,                                                                         
      active: true,                                                                             
      createdAt: new Date(),                                              
      updatedAt: new Date(),                                              
      userId: 2
    }
    ], {});
  },

  down: (queryInterface, Sequelize) => {
    /*
      Add reverting commands here.
      Return a promise to correctly handle asynchronicity.

      Example:
      return queryInterface.bulkDelete('People', null, {});
    */
   return queryInterface.bulkDelete('roles', null, {});
  }
};
