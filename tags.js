const model = require('./models');


model.beacon_master.findOne({ include: [{model: model.tags, attributes:['tag']}]})
.then(beacon=>{console.log(JSON.parse(JSON.stringify(beacon)))});