const express = require("express");
const User = require("../models/user");
//creating a router to be used
const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
  //get the data from the client
  const { name, email, password } = req.body;

  const existingUser = await User.findOne({ email: email });
  if (existingUser) {
    return res.status(400).json({ msg: "User already exists" });
  }
  let user = new User({
    name,
    email,
    password,
  });

  user = await user.save();
  //post that data in the database
  // return data to the user
});

module.exports = authRouter;
