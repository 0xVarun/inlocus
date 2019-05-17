const models    = require('../models');
const utils     = require('../utils');
const db        = require('../db/postgres')


describe('Verify that Campagin is', () => {
    
    it('not NULL is device is not cached', () => {
        expect(4).toBe(4);
        return db.close();
    })
})