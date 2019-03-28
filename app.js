const express 		      = require('express');
const path			        = require('path');
const env			          = require('dotenv');
const handlebars	      = require('express-handlebars');
const session		        = require('express-session');
const MemcachedStore    = require('connect-memcached')(session);
const validator		      = require('express-validator');
const cookieParser	    = require('cookie-parser');
const bodyParser	      = require('body-parser');
const flash 		        = require('connect-flash');
const passport		      = require('passport');
const LocalStrategy	    = require('passport-local').Strategy;
const logger            = require('morgan');
const models            = require('./models');

// process environment initialize
if(process.env.ENV === 'production') {
	env.config({ path: path.join(__dirname, 'environments/production.env') });
} else if(process.env.ENV === 'development') {
	env.config({ path: path.join(__dirname, 'environments/development.env') });
} else if(process.env.ENV === 'docker') {
	env.config({ path: path.join(__dirname, 'environments/docker.env') });
}

// set port after env variables are loaded
const port = process.env.PORT || 3000;

// db connection import
const db = require('./db/postgres');


// initialize express app
const app = express();

// initialize logger
// app.use(logger(':remote-addr - :remote-user [:date[clf]] ":method :url HTTP/:http-version" :status :res[content-length] ":referrer" ":user-agent"'));

// import routes
const admin_routes 	= require('./routes/admin/routes.js');
const app_routes	= require('./routes/app/routes.js');

// initialize view engine
app.set('views', path.join(__dirname, 'views'));
app.engine('handlebars', handlebars({ 
  defaultLayout: 'layout',
  helpers: {
    inc: function(value, option) {
      return parseInt(value) + 1;
    },
    hide: function(value, option) {
      return '****' + value.substring(value.length - 4);
    }
  } 
}));
app.set('view engine', 'handlebars');

// initialize middleware
// body parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
// cookie parser
app.use(cookieParser());
// sessions
app.use(session({ 
	secret:  'B2LrgoFLlkzr0mssrLAhz4Z11jfaW7JTaRijud9Q/j8lWdF1919+ruCOYcMH8+1/6p9BJDEmKoNVcWgmB81IoA==',
	saveUninitialized: true,
	resave: true,
  store: new MemcachedStore({
    host: [process.env.MEMCACHE] 
  })
  // cookie: { secure: true }
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

app.get('/data/beacon', async (req, res) => {
  let beacons = await models.beacon.findAll({ include: [ { model: models.device } ],order: [['createdAt', 'DESC']] });
  // console.log(JSON.stringify(beacons));
  res.render('beacondata', { title: 'Beacon Data', layout: 'blank', beacons: beacons });
});

app.get('/data/location', async (req, res) => {
  let locations = await models.location.findAll({ include: [ { model: models.device } ],order: [['createdAt', 'DESC']] });
  res.render('locationdata', { title: 'Location Data', layout: 'blank', locations: locations });
});

app.get('/data/device', async (req, res) => {
  let devices = await models.device.findAll();
  res.render('devicedata', { title: 'Device Data', layout: 'blank', devices: devices });
})

// server
// db sync
models.sequelize.sync(/*{ force: true }*/).then(() => {
  app.listen(port, () => {
    console.log(`Running on port ${port}`);
  });
});
