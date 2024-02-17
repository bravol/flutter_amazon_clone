const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
//creating a router to be used
const authRouter = express.Router();

//CREATING SIGN UP API REQUEST
authRouter.post("/api/signup", async (req, res) => {
  try {
    //get the data from the client
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({ email: email });
    if (existingUser) {
      return res.status(400).json({ msg: "User already exists" });
    }
    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({
      name,
      email,
      password: hashedPassword,
    });

    user = await user.save();
    //send the data to client side
    res.json({ user: user }); //or res.json( user);
    //post that data in the database
    // return data to the user
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//SIGN IN API
authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email: email });
    if (!user) {
      return res
        .status(400)
        .json({ msg: "User with that email does not exist" });
    }
    const isMatch = await bcryptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "Invalid password" });
    }
    //users are who say that they are, (we create the token that will help to track them)
    const token = jwt.sign({ id: user._id }, "passwordKey");
    //sending the data
    res.json({ token: token, ...user._doc });
  } catch (error) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = authRouter;
