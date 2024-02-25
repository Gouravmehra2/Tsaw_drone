const db = require('../config/db');
const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const { Schema } = mongoose;

const userSchema = new Schema({
    email: {
        type: String,
        require: true,
        unique: true,
        lowercase: true
    },
    password: {
        type: String,
        require: true,

    }
});

userSchema.pre('save', async function () {
    try {
        var user = this;
        const salt = await (bcrypt.genSalt(10));
        const hashPass = await bcrypt.hash(user.password, salt);
        console.log(hashPass);
        user.password = hashPass;

    } catch (err) {
        throw err;
    }
});

userSchema.methods.comparePassword = async function (userPassword) {
    try {
        const isMatch = await bcrypt.compare(userPassword, this.password);
        return isMatch;
    }
    catch (err) {
        throw err;
    }
}

const UserModel = db.model('user', userSchema);

module.exports = UserModel;