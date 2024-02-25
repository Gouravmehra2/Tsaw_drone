const UserService = require('../services/user.services');

exports.register = async (req, res, next) => {
    try {
        const { email, password } = req.body;
        console.log(req.body);
        const successRes = await UserService.registerUser(email, password);
        res.json({ status: true, success: "User registration successfully" });
    } catch (err) {
        throw err;
    }
}

exports.login = async (req, res, next) => {
    try {
        const { email, password } = req.body;
        const users = await UserService.checkUser(email);
        if (!users) {
            throw new Error("User does not exist");
        }
        const isMatch = await users.comparePassword(password);
        if (isMatch === false) {
            throw new Error("Password invalid");
        }
        let tokenData = { _id: users._id, email: users.email };

        const token = await UserService.generateToken(tokenData, "keyData", '1h');

        res.status(200).json({ status: true, token: token });

    } catch (err) {
        throw err;
    }
}