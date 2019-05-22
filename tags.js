
const models = require('./models');
const Sequlize = require('sequelize');

// let coord = {
// 	type: 'Polygon',
// 	coordinates: [
// 		[19.119957838109645, 72.91253906798397],
// 		[19.120196056932187, 72.91376215529476],
// 		[19.119516878957633, 72.91383189272915],
// 		[19.119243179581893, 72.91273755145107]
// 	]
// };

const coord = { 
	type: 'Polygon', 
	coordinates: [
		[ 
			[19.118876, 72.913460], 
			[19.119418, 72.913551], 
			[19.119418, 72.913551],
			[19.118812, 72.913718],
			[19.118876, 72.913460] 
		]
	], 
	crs: { 
		type: 'name', 
		properties: { 
			name: 'EPSG:4326'
		}
	}
};

// new google.maps.LatLng(19.119957838109645, 72.91253906798397),
// new google.maps.LatLng(19.120196056932187, 72.91376215529476),
// new google.maps.LatLng(19.120196056932187, 72.91376215529476),
// new google.maps.LatLng(19.119243179581893, 72.91273755145107)

// models.geofence.create({
// 	name: 'Awfis Co Working Space II',
// 	fence: coord,
// 	userId: 1,
// 	locationMasterId: 1
// })
// .then(pos => {
// 	console.log(JSON.stringify(pos));
// })
// .catch(err => {
// 	console.log(err);
// })



// models.geofence.findAll({
// 	where: Sequlize.where(
// 		Sequlize.fn('ST_Contains',
// 			Sequlize.fn('ST_Point', '19.119130, 72.913673'),
// 			Sequlize.fn('ST_Boundary', Sequlize.col('fence'))
// 			),
// 		true
// 	)
// })
// .then(d => { console.log(JSON.stringify(d)) })
// .catch(err => { console.log(err) });


models.geofence.findOne({
	// where: Sequlize.where(
	// 	Sequlize.fn('ST_ContainsProperly',
	// 		Sequlize.fn('ST_Boundary', Sequlize.col("fence")),
	// 		Sequlize.fn('ST_GeomFromText', 'POINT(19.119080 72.913548)', 4326)
	// 	), 
	// 	true
	// ),
	// attributes: ['locationMasterId']
})
.then(d => { console.log(JSON.stringify(d)) })
.catch(err => { console.log(err) });


// 19.119164 72.913686

// SELECT "locationMasterId" FROM geofences WHERE ST_Within(ST_Boundary("geofences".fence), ST_GeomFromText('POINT(19.119130 72.913673)', 4326)) = true

// 19.119299, 72.913609

// const geolib = require('geolib');

// let x = geolib.isPointInside({latitude: 19.119080, longitude: 72.913548}, [
// 	{latitude: 19.118876, longitude: 72.913460}, 
// 	{latitude: 19.119418, longitude: 72.913551}, 
// 	{latitude: 19.119418, longitude: 72.913551},
// 	{latitude: 19.118812, longitude: 72.913718},
// 	{latitude: 19.118876, longitude: 72.913460}
// ]);

// console.log(x);

// let y = geolib.getCenter([{latitude: 19.118876, longitude: 72.913460}, 
// 	{latitude: 19.119418, longitude: 72.913551}, 
// 	{latitude: 19.119418, longitude: 72.913551},
// 	{latitude: 19.118812, longitude: 72.913718},
// 	{latitude: 19.118876, longitude: 72.913460}])


// console.log(y);


// SELECT "locationMasterId" FROM geofences 
// WHERE ST_Within(geofences.fence, ST_Transform(ST_GeomFromText('POINT(19.119299 72.913609)', 4326), 4326)) = true;


// POINT(19.1190353333333 72.9135763333333)