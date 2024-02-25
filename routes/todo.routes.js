const routes = require('express').Router();
const TodoController = require('../controller/todo.controller');
routes.post('/storeTodo', TodoController.createTodo);
routes.post('/getuserTodoList', TodoController.getToDoList);
routes.post('/deletelist', TodoController.deleteToDo);

module.exports = routes;