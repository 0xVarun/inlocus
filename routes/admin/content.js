const express 			= require('express');
const router			= express.Router();
const authMiddleware	= require('../../middleware/auth');


/**
 * @url: /admin/content
 * @method: GET
 * @template: views/admin/contents.handlebars
 * @desc: Displays all user contents created by the current app user
 * 
 * @TODO: Display all contents created by all admins of the app
 */
router.get('/', authMiddleware, async (req, res) => {
    res.render('admin/contents', { title: 'Admin', layout: 'base' });
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
    res.redirect('/admin/content')
});

module.exports = router;