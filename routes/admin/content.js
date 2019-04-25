const express 			= require('express');
const router			= express.Router();
const authMiddleware	= require('../../middleware/auth');
const formidable        = require('formidable');
const fs                = require('fs');
const path              = require('path');
const utils             = require('../../utils');


/**
 * @url: /admin/content
 * @method: GET
 * @template: views/admin/contents.handlebars
 * @desc: Displays all user contents created by the current app user
 * 
 * @TODO: Display all contents created by all admins of the app
 */
router.get('/', authMiddleware, async (req, res) => {
    let contents = await utils.Content.findAll(req.user.id);
    res.render('admin/contents', { title: 'Admin', layout: 'base', contents: contents });
});

/**
 * @url: /admin/content/create
 * @method: GET
 * @template: views/admin/content.handlebars
 * @desc: Create New Content
 */
router.get('/create', authMiddleware, async (req, res) => {
    res.render('admin/content', { title: 'Admin', layout: 'base' });
});


/**
 * @url: /admin/content/create
 * @method: POST
 * @desc: Upload content and add it to the database 
 */
router.post('/create', authMiddleware, async (req, res) => {
    let form = new formidable.IncomingForm();
    form.multiples = false;
    form.uploadDir = process.env.NODE_UPLOAD_DIR;
    form.parse(req, async (err, fields, files) => {
        if(err) { res.redirect('/admin/content'); return; }
        if(files.content.size < 1) { res.redirect('/admin/content/create'); return; }
        
        let content_name = fields['content_name'];
        fs.renameSync(files.content.path, path.join(form.uploadDir, files.content.name));
        
        await utils.Content.createContent(content_name, path.join(form.uploadDir, files.content.name), `/uploads/${files.content.name}`, req.user.id);

        res.redirect('/admin/content')
    });
});

module.exports = router;