// process.env.GOOGLE_PLACES_API_KEY = 'AIzaSyD0awMda5obf1OnLxaJ1gqghu2A19Fr7Bs';
// process.env.GOOGLE_PLACES_OUTPUT_FORMAT = 'json';

const http = require('axios');
const models = require('./models');

async function getAddress(api_key, lat, lng) {

	let url = `https://maps.googleapis.com/maps/api/geocode/json?key=${api_key}&latlng=${lat},${lng}&sensor=true`;
	let res = await http.get(url);

	console.log(res.data.results[0]['formatted_address']);
}

// getAddress('AIzaSyD0awMda5obf1OnLxaJ1gqghu2A19Fr7Bs', 19.116230, 72.909851);


async function createLocations(api_key) {

	let data = await models.location.findOne({ where: { address: null } });


	let lat = data.latitude;
	let lng = data.longitude;

	let url = `https://maps.googleapis.com/maps/api/geocode/json?key=${api_key}&latlng=${lat},${lng}&sensor=true`;

	let req = await http.get(url);
	let address = req.data.results[0]['formatted_address']
	let x = await data.update({ address:address });
	console.log(JSON.stringify(x));

}

createLocations('AIzaSyD0awMda5obf1OnLxaJ1gqghu2A19Fr7Bs');
