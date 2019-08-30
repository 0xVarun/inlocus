const model		= require('../models');
const Op        = require('sequelize').Op;
const Sequelize = require('sequelize');

const distinct = (v, i, s) => {
    return s.indexOf(v) === i;
}

module.exports.createLocations = (name, type, latitude, longitude, userId) => {
    return model.location_master.create({name: name, type: type, latitude: latitude, longitude: longitude, userId: userId})
        .then( locationMaster => { return locationMaster })
        .catch( err => { throw err; } )
}

module.exports.getAllLocations = (userId) => {
    return model.location_master.findAll(
        {
            where: {
                userId: {
                    [Op.eq]: userId
                }
            }
        })
        .then( locatonMasters => { console.log(JSON.stringify(locatonMasters));return locatonMasters } )
        .catch( err => { throw err });
}

module.exports.getAllSuperadminLocations = async (userId) => {
    let location = await model.sequelize.query(`SELECT DISTINCT * FROM location_masters WHERE "userId" = ${userId} OR "userId" in (SELECT "userId" FROM roles WHERE roles.superadmin = true)`, { type: Sequelize.QueryTypes.SELECT });
    console.log(JSON.stringify(location))
    return location;
}

module.exports.getUsableLocations = async userId => {
    let location = await model.sequelize.query(`SELECT DISTINCT * FROM location_masters WHERE "userId" = ${userId} OR "userId" in (SELECT "userId" FROM roles WHERE roles.superadmin = true)`, { type: Sequelize.QueryTypes.SELECT });
    console.log(JSON.stringify(location))
    return location;
}

module.exports.deleteLocation = (id) => {
    return model.location_master.destroy(
        { 
            where: { 
                id: {
                    [Op.eq]:id
                } 
            } 
        });
}

module.exports.findOne = (id) => {
    return model.location_master.findOne(
        { 
            where: { 
                id: { 
                    [Op.eq]: id 
                } 
            }, 
            include: [
                {
                    model: model.tags
                }
            ]
        })
        .then(loc => { return loc })
        .catch(err => { throw err });
}

module.exports.findOneAndUpdate = async (id, name, type, latitude, longitude) => {
    model.location_master.findByPk(id)
        .then( location => {
            location.update({ name: name, type: type, latitude: latitude, longitude: longitude });
        })
        .catch( err => { throw err; });
}