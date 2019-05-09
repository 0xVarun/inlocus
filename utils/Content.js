const model		= require('../models');


module.exports.createContent = (name, path, url, userId) => {
    return model.content.create({ name: name, path: path, url: url, userId: userId })
        .then(content => { return content; })
        .catch(err => { throw err; });
};


module.exports.findAll = (userId) => {
    return model.content.findAll({ where: { userId: userId }})
        .then(contents => { return contents; })
        .catch(err => { throw err; });
}