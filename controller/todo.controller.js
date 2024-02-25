const TodoService = require('../services/todo.serviices');

exports.createTodo = async (req, res, next) => {
    try {
        const { userId, title, desc } = req.body;
        let todo = await TodoService.createTodo(userId, title, desc);
        res.json({ status: true, success: todo });
    } catch (err) {
        throw err;
    }
}

exports.getToDoList = async (req, res, next) => {
    try {
        const { userId } = req.body;
        let todoData = await TodoService.getUserToDoList(userId);
        res.json({ status: true, success: todoData });
    } catch (error) {
        console.log(error, 'err---->');
        next(error);
    }
}
exports.deleteToDo = async (req, res, next) => {
    try {
        const { id } = req.body;
        let deletedData = await ToDoService.deleteToDo(id);
        res.json({ status: true, success: deletedData });
    } catch (error) {
        console.log(error, 'err---->');
        next(error);
    }
}