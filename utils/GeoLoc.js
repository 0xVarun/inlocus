const model		= require('../models');

/**
 * Create New Geo Fence
 *
 * @param      {JSON}       payload    Name Of Geo Fence
 * @return     {geofence}   Newly created Geo Fence
 */
module.exports.create = function(payload) {
	
};


/**
 * Returns all geofences 
 */
module.exports.findAllFences = function(id) {
	return model.geofence.findAll({ where: { userId: id }})
		.then(fences => { return fences; })
		.catch(err => { throw err; });
}