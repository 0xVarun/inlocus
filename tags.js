// process.env.GOOGLE_PLACES_API_KEY = 'AIzaSyD0awMda5obf1OnLxaJ1gqghu2A19Fr7Bs';
// process.env.GOOGLE_PLACES_OUTPUT_FORMAT = 'json';

const http = require('axios');
url = "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyD0awMda5obf1OnLxaJ1gqghu2A19Fr7Bs&latlng=19.116230,72.909851&sensor=true"


async function getAddress(api_key, lat, lng) {

	let url = `https://maps.googleapis.com/maps/api/geocode/json?key=${api_key}&latlng=${lat},${lng}&sensor=true`;
	let res = await http.get(url);

	console.log(res.data.results[0]['formatted_address']);
}

getAddress('AIzaSyD0awMda5obf1OnLxaJ1gqghu2A19Fr7Bs', 19.116230, 72.909851);

