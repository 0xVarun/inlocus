const express 		= require('express');
const path			= require('path');
const env			= require('dotenv');
const handlebars	= require('express-handlebars');
const session		= require('express-session');
const validator		= require('express-validator');
const cookieParser	= require('cookie-parser');
const bodyParser	= require('body-parser');
const flash 		= require('connect-flash');
const passport		= require('passport');
const LocalStrategy	= require('passport-local').Strategy;
const logger		= require('morgan');
const port 			= process.env.PORT || 3000;

// process environment initialize
if(process.env.ENV === 'production') {
	env.config({ path: path.join(__dirname, 'environments/production.env') });
} else if(process.env.ENV === 'development') {
	env.config({ path: path.join(__dirname, 'environments/development.env') });
}

// db connection import
const db			= require('./db/postgres');


// initialize express app
const app 			= express();

// initialize logger
app.use(logger(':remote-addr - :remote-user [:date[clf]] ":method :url HTTP/:http-version" :status :res[content-length] ":referrer" ":user-agent"'));

// import routes
const admin_routes 	= require('./routes/admin/routes.js');
const app_routes	= require('./routes/app/routes.js');

// initialize view engine
app.set('views', path.join(__dirname, 'views'));
app.engine('handlebars', handlebars({ defaultLayout: 'layout' }));
app.set('view engine', 'handlebars');

// initialize middleware
// body parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
// cookie parser
app.use(cookieParser());
// sessions
app.use(session({ 
	secret:  'B2LrgoFLlkzr0mssrLAhz4Z11jfaW7JTaRijud9Q/j8lWdF1919+ruCOYcMH8+1/6p9BJDEmKoNVcWgmB81IoA==',
	saveUninitialized: true,
	resave: true
}));
// flash
app.use(flash());

// set static route
app.use(express.static(path.join(__dirname, 'public')));

// initialize passport
app.use(passport.initialize());
app.use(passport.session());

// validator
app.use(validator({
  errorFormatter: function(param, msg, value) {
    var namespace = param.split('.'), root = namespace.shift(),
        formParam = root;
    while (namespace.length) {
      formParam += '[' + namespace.shift() + ']';
    }
    return { param: formParam, msg: msg, value: value };
  }
}));

// Globals
app.use(function (req, res, next) {
  res.locals.success_msg = req.flash('success_msg');
  res.locals.error_msg = req.flash('error_msg');
  res.locals.error = req.flash('error');
  res.locals.user = req.user || null;
  next();
});

// routes
app.use('/', app_routes);
app.use('/admin', admin_routes);

// server
app.listen(port, () => {

});