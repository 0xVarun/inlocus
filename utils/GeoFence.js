const db		= require('../db/postgres');
const model		= require('../models');

/**
 * Create New Geo Fence
 *
 * @param      {String}  name    Name Of Geo Fence
 * @param      {Integer}  user    User id
 * @return     {geofence}  Newly created Geo Fence
 */
module.exports.create = function(name, user, lat, lng, rad, location) {
	return model.geofence.create({ name: name, userId: user, latitude: lat, longitude: lng, radius: rad, locationMasterId: location })
		.then( fence => { return fence })
		.catch( err => { throw err; })
};


/**
 * Find All Fences
 * 
 * @param		{Integer} id UserId
 * @return 		{Object} All Fences for that User
 */
module.exports.findAllFences = function(id) {
	return model.geofence.findAll({ where: { userId: id }})
		.then(fences => { return fences; })
		.catch(err => { throw err; });
}


/**
 * Find Fence By Id
 * 
 * @param		{Interger} id fenceId
 * @return		{Object} Geofence
 */
module.exports.findOneFence = id => {
	return model.geofence.findById(id)
		.then(fence => { return fence; })
		.catch(err => { throw err; });
};


/**
 * Update Fence By Id
 */
module.exports.findOneAndUpdate = (id, payload) => {
	// return model.geofence.update({ latitude: payload.lat, longitude: payload.lng, radius: payload.rad, name: payload.name })
	// 	.then(fence => { return fence; })
	// 	.catch(err => { throw err; });
	model.geofence.findByPk(id)
        .then( geofence => {
            geofence.update({ latitude: payload.lat, longitude: payload.lng, radius: payload.rad, name: payload.name, locationMasterId: payload.location });
        })
        .catch( err => { throw err; });
}