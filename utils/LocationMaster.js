const model		= require('../models');
const Op        = require('sequelize').Op;

const distinct = (v, i, s) => {
    return s.indexOf(v) === i;
}

module.exports.createLocations = async (name, type, latitude, longitude, userId) => {
    // return model.location_master.create({name: name, type: type, latitude: latitude, longitude: longitude, userId: userId})
    //     .then( locationMaster => { return locationMaster })
    //     .catch( err => { throw err; } )

    let point = { 
		type: 'Point', 
		coordinates: [latitude, longitude],
		crs: { type: 'name', properties: { name: 'EPSG:4326'} }
	};

    try {
        let mLocationMaster = await model.location_master.create({ name, type, latlng: point, userId });
        return mLocationMaster;
    } catch (err) {
        throw err;
    }

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
        .then( locatonMasters => { return locatonMasters } )
        .catch( err => { throw err });
}

module.exports.getAllSuperadminLocations = () => {
    return model.location_master.findAll({include:[{model: model.user, include: [{model: model.roles}]}]})
        .then(location => { return location; })
        .catch(err => { throw err; });
}

module.exports.getUsableLocations = async userId => {
    let f = [];
    let suLocations = await model.location_master.findAll({include:[{model: model.user,attributes: [],include: {model: model.roles, attributes: [], where: {superadmin: { [Op.eq]: true } }}}]});
    let locations = await model.location_master.findAll({where: { userId: { [Op.eq]: userId } }});
    suLocations = JSON.parse(JSON.stringify(suLocations));
    suLocations.map(s => { f.push(s) });
    locations = JSON.parse(JSON.stringify(locations));
    locations.map(s => { f.push(s) });
    return f.filter(distinct);
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
    let point = { 
		type: 'Point', 
		coordinates: [latitude, longitude],
		crs: { type: 'name', properties: { name: 'EPSG:4326'} }
    };
    
    model.location_master.findByPk(id)
        .then( location => {
            location.update({ name: name, type: type, latlng: point });
        })
        .catch( err => { throw err; });
}