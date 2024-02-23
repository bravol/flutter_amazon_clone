//creating admin middleware

const jwt = require("jsonwebtoken");
const User = require("../models/user");

const admin = async (req, res, next) => {
  try {
    const token = req.header("x-auth-token");
    if (!token)
      return res.status(401).json({ msg: "no token, authorization denied" });

    const verified = jwt.verify(token, "passwordKey");
    if (!verified) return res.status(401).json({ msg: "token not verified" });
    const user = await User.findById(verified.id);
    if (user.type == "user" || user.type == "seller")
      return res
        .status(401)
        .json({ msg: "admin resource. authorization denied" });

    req.user = verified.id;
    req.token = token;
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

module.exports = admin;
