const mongoose = require('mongoose');
console.log('enter');
const connection = mongoose.createConnection('mongodb+srv://codergourav:Gourav@tsaw.9plnuti.mongodb.net/newtodo').on('open', () => {
    console.log("connected successfully");
}).on('error', () => {
    console.log("MongoDb conecction eroor");
});

module.exports = connection; 