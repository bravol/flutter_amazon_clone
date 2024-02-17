const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
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

module.exports = authRouter;
