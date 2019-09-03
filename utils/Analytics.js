const model 	= require('../models');
const Op 		= require('sequelize').Op;

/**
 * Gets all locations.
 *
 * @param      {Boolean}  	su      Return all if Superuser
 * @param      {Number}  	userId  The user identifier
 * @return     {(Array|Object)}  			All locations.
 */
module.exports.getAllLocations = async (su, userId) => {
	let data;
	if(su) {
		data = await model.location.findAll({
			attributes: ['latitude', 'longitude'],
		});
	} else {
		data = await model.location.findAll({
			attributes: ['latitude', 'longitude'],
			include: [
				{
					model: model.device,
					attributes: [],
					include: {
						model: model.appuser,
						attributes: [],
						include: {
							model: model.application,
							where: {
								userId: userId
							},
							attributes: [],
						}
					}
				}
			]
		});
	}

	return data;
}


/**
 * Gets all beacon locations.
 *
 * @param      {Boolean}          	su      Is User Superuser
 * @param      {Number}          	userId  The user identifier
 * @return     {(Array|Object)}  			All beacon locations.
 */
module.exports.getAllBeaconLocations = async (su, userId) => {
	let mdata;
	if(su) {
		mdata = await model.beacon_master.findAll({
			attributes: [],
			include: {
				model: model.location_master,
				attributes: ['latitude', 'longitude']
			}
		});
	} else {
		mdata = await model.beacon_master.findAll({
			attributes: [],
			include: {
				model: model.location_master,
				attributes: ['latitude', 'longitude'],
				where: {
					userId: {
						[Op.eq]: userId
					}
				}
			}
		});
	}

	let data = [];

	for(let i = 0; i < mdata.length; i++) {
		data.push(mdata[i]['location_master'])
	}

	return data;
}


/**
 * Gets the application user level information.
 *
 * @param      {Number}  mdeviceId  The mdevice identifier
 * @param      {Number}  userId  	User Id
 * @return     {Object}  			The application user level information.
 */
module.exports.getAppUserLevelInfo = async (mdeviceId, userId) => {

	let deviceList = await model.application.findAll({
		where: { userId: { [Op.eq]: userId } },
		include: [ {model: model.appuser, attributes: ["deviceId"], where: { deviceId: { [Op.eq]: mdeviceId }}} ],
		attributes: []
	});

	if(deviceList.length == 0) {
		return null;
	}

	let locations = await model.location.findAll({ where: { deviceId: mdeviceId }, order: [['createdAt', 'DESC']] });
	
	let deviceId = await model.device.findOne({where: {id: mdeviceId}, include:[{model:model.appuser, include: {model:model.application}}]});
	
	let countClicked = await model.notify.count({ where: { fstatus: 'CLICKED', deviceId: mdeviceId} });
	let countSent = await model.notify.count({ where: { istatus: 'SENT', deviceId: mdeviceId} });
	let notif = await model.notify.findOne({where:{istatus: 'SENT', deviceId: mdeviceId}, order: [['createdAt', 'DESC']] });
	
	let beaconCount = await model.notify.count({ where: { deviceId: { [Op.eq]: mdeviceId }, type: { [Op.eq]: 'BEACON' } } })
	let locCount = await model.notify.count({ where: { deviceId: { [Op.eq]: mdeviceId }, type: { [Op.eq]: 'LOCATION' } } })
	
	let beacons = await await model.beacon.findAll({ where: { deviceId: { [Op.eq]: mdeviceId }} , order: [['createdAt', 'DESC']]});
	let lastBeacon = `${beacons[0]['major']}, ${beacons[0]['major']}` || '';

	return { title: 'Admin', layout: 'base', location: locations, tid: mdeviceId, device:deviceId, countClicked: countClicked, countSent: countSent, lastNotif: beaconCount, lastNotifc:locCount, beacons: beacons, lastBeacon };
}


module.exports.analyticsCount = async function(userId) {
    let data = {}
    let orCond = [];
    let deviceList = await model.application.findAll({
		where: { userId: { [Op.eq]: userId } },
		include: [ {model: model.appuser, attributes: ["deviceId"]} ],
		attributes: []
    });
    
    if(deviceList[0]['appusers'].length == 0) {
        data['deviceCount'] = 0;
        data['clickCount'] = 0;
        data['sentCount'] = 0;
        data['unclickedCount'] = 0;
    } else {
        data['deviceCount'] = deviceList[0]['appusers'].length;
        for(let i = 0; i < deviceList[0]['appusers'].length; i++) {
            orCond.push(deviceList[0]['appusers'][i]['deviceId']);
        }
        let clickCount = await model.notify.count({
            where: {
                deviceId: { [Op.or]: orCond },
                fstatus: { [Op.eq]: "CLICKED" }
            }
        });
        let sentCount = await model.notify.count({
            where: {
                deviceId: { [Op.or]: orCond },
                istatus: { [Op.eq]: "SENT" }
            }
        });
        data['clickCount'] = clickCount;
        data['sentCount'] = sentCount;
        data['unclickedCount'] = Math.abs(sentCount - clickCount);
    }

    return data;
}

module.exports.getDeviceOrCondition = async (userId) => {
	let orCond = [];
	let deviceList = await model.application.findAll({
		where: { userId: { [Op.eq]: userId } },
		include: [ {model: model.appuser, attributes: ["deviceId"]} ],
		attributes: []
	});
	if(deviceList[0]['appusers'].length == 0) {
		return orCond;
	} else {
		for(let i = 0; i < deviceList[0]['appusers'].length; i++) {
            orCond.push(deviceList[0]['appusers'][i]['deviceId']);
		}
		console.log(orCond);
		return orCond;
	}
}