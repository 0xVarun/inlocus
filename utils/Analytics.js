const model 	= require('../models');


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