const model 	= require('../models');


/**
 * Gets all locations.
 *
 * @param      {Boolean}  su      Return all if Superuser
 * @param      {Number}  userId  The user identifier
 * @return     {Object}  All locations.
 */
module.exports.getAllLocations = async (su, userId) => {
	let data;
	if(su) {
		data = await model.location.findAll({
			attributes: ['latitude', 'longitude'],
		});
	} else {
		data = await model.location.findAll({
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
							where: {
								userId: userId
							},
							attributes: [],
						}
					}
				}
			]
		});
	}

	return data;
}