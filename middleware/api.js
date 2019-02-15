const jwt 	= require('jsonwebtoken');

module.exports.apiAuth = (req, res, next) => {
	let bearerHeader = req.headers['authorization'];
	if(typeof bearerHeader === 'undefined') {
		res.sendStatus(403);
		return;
	} 
	let bearerToken = bearerHeader.split(' ')[1];
	jwt.verify(bearerToken, 'jcwirrxNiX3iyMQ075xr5k8vC6hQbiSwc5JsvJbQCfsS1gdF+hg7/qNe9duZP5dclypByeqPE18AaoDI+Ghmmw==', (err, decode) => {
		if(err) { res.sendStatus(403); return }
		res.locals.user = decode;
		next();
	})
};