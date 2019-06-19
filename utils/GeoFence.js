const model		= require('../models');
const Op		= require('sequelize').Op;
const geolib	= require('geolib');

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
	return model.geofence.findAll(
		{ 
			where: { 
				userId: {
					[Op.eq]: id
				} 
			}
		})
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
	return model.geofence.findByPk(id)
		.then(fence => { return fence; })
		.catch(err => { throw err; });
};


/**
 * Update Fence By Id
 *
 * @param      {Number}  id       The identifier
 * @param      {Object}  payload  The payload
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
};


/**
 * Returns Users seen in the geofence
 *
 * @param      {Number}  id      The identifier
 * @param      {Number}  userId  The User identifier
 * @return     {Object}  Users seen Geofence
 */
module.exports.usersInGeofence = async (id, userId) => {
	let geofence = await model.geofence.findByPk(id);
	let locations = await model.location.findAll({
		attributes: ['latitude', 'longitude'],
		include: [
			{
				model: model.device,
				attributes: [],
				include: {
					model: model.appuser,
					attributes: [],
					include: {
						model: model.application,
						attributes: [],
						// where: {
						// 	userId: {
						// 		[Op.eq]: userId
						// 	}
						// }
					}
				}
			}
		]
	});
	let valid = [];
	for(let i = 0; i < locations.length; i++) {
		let isInsideFence = geolib.isPointInCircle(
			// POINT
			{ latitude: locations[i].latitude, longitude: locations[i].longitude },
			// GEOFENCE
			{ latitude: geofence.latitude, longitude: geofence.longitude}
		);

		if(isInsideFence) { valid.push(locations[i]); }
	}

	return valid;
};