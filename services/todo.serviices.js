const TodoModel = require("../model/todo.model");

class TodoService {
    static async createTodo(userId, title, des) {
        const createTodo = new TodoModel({ userId, title, des });
        return await createTodo.save();
    }
    static async getUserToDoList(userId) {
        const todoList = await TodoModel.find({ userId })
        return todoList;
    }
    static async deleteToDo(id) {
        const deleted = await TodoModel.findByIdAndDelete({ _id: id })
        return deleted;
    }
}
module.exports = TodoService;