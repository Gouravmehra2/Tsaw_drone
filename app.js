const express = require('express');
const body_parser = require('body-parser');
const userRoutes = require('./routes/user.routes');
const UserService = require('./services/user.services');
const TodoRouter = require('./routes/todo.routes');
const app = express();

app.use(body_parser.json());

app.use('/', userRoutes);
app.use('/', TodoRouter);

module.exports = app;