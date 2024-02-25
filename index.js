const app = require('./app');
const db = require('./config/db');
const todoModel = require('./model/todo.model');
const UserModel = require('./model/user.model');

const port = 3000;

app.get('/', (req, res) => {
    res.send('Hello world!!!!!');
});

app.listen(port, () => {
    console.log(`listen data on prot 3000 http://localhost:${port}`);
});