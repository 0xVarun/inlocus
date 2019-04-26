const Redis = require('ioredis');
const Cache = require('redis-json');


const redis = new Redis();
const cache = new Cache(redis, { prefix: 'cache:' });

module.exports.redis = redis;
module.exports.cache = cache;