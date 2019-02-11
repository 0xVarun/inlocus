
module.exports = function(req, res, next) {
	if(req.isAuthenticated() && req.user.superadmin) {
		return next(); 
	} else {
		res.redirect('/admin/login');
	}
}