
module.exports = function(req, res, next) {
	if(req.isAuthenticated() && req.user.role.superadmin) {
		return next(); 
	} else {
		res.redirect('/admin/login');
	}
}