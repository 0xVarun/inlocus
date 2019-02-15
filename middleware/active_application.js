const App 	= require('../utils/Application');

module.exports = async (req, res, next) => {
	let key = req.headers['x-app-api-key'];
	let secret = req.headers['x-app-api-secret'];
	// console.log(req.headers);
	let isActive = undefined;

	if(!key || !secret) {
		console.log(key + "\t" + secret);
		res.sendStatus(400);
		return;
	}

	try {
		isActive = await App.isActive(key, secret);
	} catch (err) {
		res.status(500).send({ 'message': err });
		return;
	}

	if(isActive === true) {
		return next();
	} else if(isActive === false){
		res.status(401).send({ 'message': 'App Not active' });
	} else {
		res.sendStatus(400);
	}
}