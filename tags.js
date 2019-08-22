// const models = require('./models');


// let data = require('./final.json');

// // bssid: DataTypes.STRING,
// // ssid: DataTypes.STRING,
// // rssi: DataTypes.DOUBLE

// async function insertWifi(wifis, locationId) {
// 	for(let i = 0; i < wifis.length; i++) {
// 		console.log(`${wifis[i]['ssid']} - ${wifis[i]['bssid']} - ${locationId}`);

// 		let wif = await models.WifiMaster.create({
// 			ssid: wifis[i]['ssid'] || '',
// 			bssid: wifis[i]['bssid'],
// 			rssi: wifis[i]['rssi'],
// 			locationMasterId: locationId
// 		});

// 	}
// }


// async function insertLocation() {
// 	for(let i = 0; i < data.length; i++) {

// 		let temp = data[i];

// 		console.log(`NEW LOCATION ${temp['location']['Name']} - ${temp['location']['type']}`)

// 		let loc = await models.location_master.create({ 
// 			name: temp['location']['Name'] || '',
// 			type: temp['location']['type'],
// 			latitude: temp['location']['latitude'],
// 			longitude: temp['location']['longitude'],
// 			userId: 1			 
// 		});

// 		console.log(`LOCATION CREATED WITH ID ${loc.id}`);

// 		await insertWifi(temp['wifis'], loc.id);

// 	}
// }

// insertLocation();


// const utils = require('./utils');

// const wifis = [
// 	{"bssid":"14:1f:ba:74:73:08","ssid":"Joispot-wifi","freq":-42,"rssi":0,"distance":2462},
// 	{"bssid":"78:32:1b:9a:e5:90","ssid":"Osmos","freq":-42,"rssi":0,"distance":2462},
// 	{"bssid":"24:f5:a2:15:8b:1a","ssid":"Linksys01906","freq":-42,"rssi":0,"distance":2462}
// ]

// async function testWifi(){

// 	let c = await utils.Campaign.getOneWifiCampaign(1, '23', wifis);
// 	console.log(JSON.parse(JSON.stringify(c)));
// }

// testWifi();

// const geolib = require('geolib');

// let x = geolib.isPointInCircle({latitude: '19.119896460324526', longitude: '72.91322736069561'}, 
// 	{latitude: '19.1191426148654', longitude: '72.9136388137974'}, '40');

// 19.1191 |     72.9136 |  35.3767

// console.log(x);


const model = require('./models');
const Sequelize = require('sequelize');
const Op = require('sequelize').Op;

// async function test(userId) {
// 	let android = 0;
// 	let iPhone = 0;
// 	let x = await model.appuser.findAll({
// 		attributes: ['id'],
// 		include:[
// 			{
// 				model: model.device,
// 				attributes: ['GAID'],
// 				// include: 
// 				// }
// 			},
// 			{
// 				model: model.application,
// 				attributes: ['id'],
// 				where: {
// 					userId: userId
// 				}
// 			}
// 		]
// 	});

// 	x.map(d => {

// 		let type = d['device']['GAID']

// 		if(type.includes('Android') || type.includes('android')) {
// 			android++;
// 		} else if(type.includes('iPhone')) {
// 			iPhone++;
// 		}
// 	});

// 	console.log({android, iPhone});

// }	

// test(1);


// const uuid = require('uuid/v4');


// async function doit(){
// 	await model.appuser.update({ inlocusId: uuid() }, { where: { id: 1 } });
// 	await model.appuser.update({ inlocusId: uuid() }, { where: { id: 2 } });
// 	await model.appuser.update({ inlocusId: uuid() }, { where: { id: 3 } });
// 	await model.appuser.update({ inlocusId: uuid() }, { where: { id: 4 } });
// 	await model.appuser.update({ inlocusId: uuid() }, { where: { id: 5 } });
// }


// doit();


async function doit() {
	let geofence = await model.geofence.findOne();
	console.log(JSON.stringify(geofence));
	let data = await model.location.findAll({
		where: Sequelize.where(
			Sequelize.fn('ST_DWithin',
				Sequelize.fn('ST_GeomFromText', `POINT(${geofence.latitude} ${geofence.longitude})`, 4326),
				Sequelize.fn('ST_GeomFromText', Sequelize.fn('CONCAT', 'POINT(', Sequelize.col('latitude'), ' ', Sequelize.col('longitude'), ')'), 4326),
			geofence.radius),
			false
		),
		include: [
			{
				model: model.device,
				attributes: [],
				include:{
					model: model.appuser,
					attributes: [],
					include: {
						model: model.application,
						where: {
							userId: 1
						},
						attributes: []
					}
				}
			}
		]
	});

	console.log(data.length);

}

// doit();


async function geoFenceProper() {
	let geofence1 = await model.geofence.findOne();
	console.log(JSON.stringify(geofence1));
	let data = await model.location.findAll({
		where: Sequelize.where(
			Sequelize.fn('ST_Within',
				// POINT
				Sequelize.fn('ST_GeomFromText',
					Sequelize.fn('CONCAT', 
						'POINT(',
						Sequelize.col('latitude'),
						' ',
						Sequelize.col('longitude'),
						')'
					), // CONCAT POINT
					4236
				), 
				Sequelize.fn('ST_Buffer',
					Sequelize.fn('ST_GeomFromText',
						Sequelize.fn('CONCAT', 'POINT(', geofence1.latitude, ' ', geofence1.longitude, ')'), 
						4236
						), 
					geofence1.radius
					)
				), true
			)
	});
	console.log(data.length);
}

// geoFenceProper();


// SELECT "id" 
// FROM "locations" AS "location" 
// WHERE ST_Within(
// 	ST_GeomFromText(CONCAT('POINT(', "latitude", ' ', "longitude", ')'), 4236), 
// 	ST_Buffer(
// 		ST_GeomFromText(CONCAT('POINT(', 19.0079390748637, ' ', 72.8294547762655, ')'), 4236), 
// 		76.7612348238529
// 		)
// 	) = true;

// 18.522227, 73.822741



// SELECT ST_GeomFromText(CONCAT('POINT(', latitude, ' ', longitude, ')'), 4326) as mpoint, id 
// FROM locations
// WHERE ST_DWithin(ST_GeomFromText('POINT(19.0079390748637 72.8294547762655)', 4326), mpoint, 76.76123)


// SELECT * FROM "locations" AS "location" 
// LEFT OUTER JOIN "devices" AS "device" 
// ON "location"."deviceId" = "device"."id" 
// LEFT OUTER JOIN ( "appusers" AS "device->appusers" 
// 	INNER JOIN "applications" AS "device->appusers->application" 
// 	ON "device->appusers"."applicationId" = "device->appusers->application"."id" 
// 	AND "device->appusers->application"."userId" = 1 
// ) 
// ON "device"."id" = "device->appusers"."deviceId" 
// WHERE ST_DWithin(
// 	ST_GeomFromText('POINT(19.0079390748637 72.8294547762655)', 4326), 
// 	ST_GeomFromText(
// 		CONCAT('POINT(', latitude, ' ', longitude, ')'), 4326), 
// 	76.7612348238529
// ) = true;


// SELECT * FROM locations
// WHERE ST_Contains(
// 	ST_Buffer(
// 		ST_GeomFromText('POINT(19.0079390748637 72.8294547762655)', 4326),
// 		76.7612348238529
// 	),
// 	ST_GeomFromText(CONCAT('POINT(', latitude, ' ', longitude, ')'), 4326)
// )

// 19.008145 72.829472

const geoq = require('winnow');


async function geoquery() {
	let geofence = JSON.parse(JSON.stringify(await model.geofence.findAll()));
	let locations = JSON.parse(JSON.stringify(await model.location.findAll()));

	let geojson = [];

	let geofenceJSON = [];
	let geofenceRadius = [];

	for(let i = 0; i < locations.length; i++) {
		let clocation = locations[i];
		let lat = clocation.latitude;
		let lng = clocation.longitude;
		let tempGeoJson = {
			"type": "point",
			"coordinates": [lng, lat]
		};
		geojson.push(tempGeoJson);
	}

	let temp = { type: 'Point',
     coordinates: [72.91381804806417, 19.11937850573807] };
     // coordinates: [ 19.119162380217592, 72.91362758914738 ] };

    geojson.push(temp);

	let options = {
		spatialPredicate: 'ST_Contains',
		geometry: {
			"type": "Polygon",
			"coordinates": [
				[
					[ 72.91381804806417, 19.11937850573807], 
					[ 72.91354982716268, 19.119424122294816], 
					[ 72.91344766117379, 19.118885173915757], 
					[ 72.91369710661218, 19.118839557210265],
					[ 72.91381804806417, 19.11937850573807]
				]
			]
		}
	};

	const filter = geoq.prepareQuery(options);
	console.log(filter(geojson));

	// for(let i = 0; i < geofence.length; i++) {
	// 	let cgeo = geofence[i];
	// 	let tempGeoJson = {
	// 		"type": "point",
	// 		"coordinates": [cgeo['latitude'], cgeo.longitude]
	// 	};
		
	// 	options['geometry'] = tempGeoJson;
	// 	options['offset'] = cgeo.radius;

	// 	console.log(options)

	// 	const filter = geoq.prepareQuery(options)

	// 	const filtered = filter(geojson);

	// 	console.log(`Fence: ${cgeo.id}, count: ${filtered.length}`);
	// 	console.log(filtered);
	// }	




}

// geoquery();


async function testing() {
	let locations = await model.location.findAll({
		attributes: [
			[Sequelize.literal(`DATE_TRUNC('day', "createdAt")`), 'timestamp'],
			'id',
			'createdAt'
		],
		order: Sequelize.literal('timestamp DESC')
	});

	let l = locations.map(loc => {
		let x = loc['id'];
		// let y = new Date(loc['createdAt']);
		let y = '1';
		try {
			var z = new Date(loc['timestamp']);
		} catch (er) {
			console.log(z);
		}
		return { 'id': x, 'created': y, 'timestamp': z }
	})

	console.log(JSON.stringify(l));

	process.exit(0);
}

// testing();


// const addon = require('./build/Release/sort.node');
async function test() {
	let data = await model.geofence.findAll({ limit: 10 });
	// addon.sort(JSON.parse(JSON.stringify(data)), (err, data) => {
	// 	console.log(err);
	// 	console.log('----');
	// 	console.log(data);
	// });
	// 
	console.log(JSON.stringify(data));
}

// test();

// console.log(addon.sort(1,2));


async function finalTest() {
	let location = await model.location.findOne({ where: { id: 19 } });
	// let geofence = await model.geofence.findOne({
	// 	where: Sequelize.fn('ST_Within', 
	// 		Sequelize.fn('ST_GeomFromGeoJSON', location.geometry), 
	// 		Sequelize.col('geometry')
	// 	)
	// });
	let res = await model.sequelize.query(`select geofences."locationMasterId" 
		from locations, geofences 
		where ST_Within(locations.geometry, geofences.geometry) 
		and locations.id = ${location.id}`, 
		{ type: Sequelize.QueryTypes.SELECT}
	)
	console.log(JSON.stringify(res));
}

// finalTest();

async function appLevel() {
	let devices = await model.application.findAll({
		where: { userId: 2 },
		include: [{ model: model.appuser, attributes: ["deviceId"] }],
		attributes: []
	});

	let deviceCount = 0;
	// console.log(JSON.stringify(devices));
	for(let i = 0; i < devices.length; i++) {
		deviceCount+= devices[i]["appusers"].length;
	}

	console.log(deviceCount);
}

// appLevel();

async function userCount(appId, userId) {
	let appId = 1;
	let deviceId = 3;

	let devices = await model.appuser.findAll({
		attributes: [],
		order: [['createdAt', 'DESC']],
		include: [
			{
				model: model.device,
				attributes: ['id']
			},
			{
				model: model.application,
				attributes: [],
				where: {
					id: {
						[Op.eq]: appId
					},
					userId: {
						[Op.eq]: 1
					}
				}
			}
		]
	});

	if(devices.length <= 0 ) {
		return {}
	}

	let deviceIds = devices.map(dev => { return dev['device']['id']; })
	let data = await model.location.findAll({
		// limit: 7,
		attributes: [
			[Sequelize.literal(`DATE("createdAt")`), 'date'],
			[Sequelize.cast(Sequelize.literal(`COUNT(*)`), "int"), 'count']
		],
		where: {
			deviceId: {
				[Op.or]: deviceIds
			}
		},
		group: ['date'],
		order: [[Sequelize.literal(`DATE("createdAt")`), 'ASC']]
	});

	console.log(JSON.stringify(data));

}

userCount();