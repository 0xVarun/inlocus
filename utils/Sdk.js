const model		= require('../models');
const Sequelize = require('sequelize');
const Op        = Sequelize.Op;

module.exports.uploadSDK = async (path, userId) => {
	let userSdk = await model.SDK.findOne({ 
		where: { 
			userId: {
				[Op.eq]: userId
			} 
		} 
	});
	if(userSdk) {
		model.SDK.findOne({ 
			where: { 
				userId: {
					[Op.eq]: userId
				} 
			} 
		}).then(sdk => {
			sdk.update({ sdk_path: path, userId: userId });
		}).catch(err => { throw err; });
	} else {
		try {
			await model.SDK.create({ sdk_path: path, userId: userId });
		} catch (err) {
			return err;
		}
	}
}