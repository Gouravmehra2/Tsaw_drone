const routes = require('express').Router();
const UserController = require('../controller/user.controller');

routes.post('/registration', UserController.register);
routes.post('/login', UserController.login);

module.exports = routes;