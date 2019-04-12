const db		= require('../db/postgres');
const model		= require('../models');


module.exports.createLocations = (name, type) => {
    return model.location_master.create({name: name, type: type})
        .then( locationMaster => { return locationMaster })
        .catch( err => { throw err; } )
}

module.exports.getAllLocations = () => {
    return model.location_master.findAll()
        .then( locatonMasters => { return locatonMasters } )
        .catch( err => { throw err });
}

module.exports.deleteLocation = (id) => {
    return model.location_master.destroy({ where: { id: id } })
}

module.exports.findOne = (id) => {
    return model.location_master.findOne({ where: { id: id }, include: [{model: model.ltags}]})
        .then(loc => { return loc })
        .catch(err => { throw err });
}

module.exports.findOneAndUpdate = async (id, name, type) => {
    model.location_master.findByPk(id)
        .then( location => {
            location.update({ name: name, type: type });
        })
        .catch( err => { throw err; });
}