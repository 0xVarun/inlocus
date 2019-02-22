const db		= require('../db/postgres');
const model		= require('../models');

/**
 * Create New Geo Fence
 *
 * @param      {String}  name    Name Of Geo Fence
 * @param      {Integer}  user    User id
 * @return     {geofence}  Newly created Geo Fence
 */
module.exports.create = function(name, user) {
	return model.geofence.create({ name: name, userId: user })
		.then( fence => { return fence })
		.catch( err => { throw err; })
};


/**
 * Returns all geofences 
 */
module.exports.findAllFences = function(id) {
	return model.geofence.findAll({ where: { userId: id }})
		.then(fences => { return fences; })
		.catch(err => { throw err; });
}