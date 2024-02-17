//IMPORT FROM PACKAGE
const express = require("express");
const mongoose = require("mongoose");

//IMPORT OTHER FILES
const authRouter = require("./routes/auth");

const PORT = 3001;
const app = express();

//middle ware
//client-server-client
app.use(express.json());
app.use(authRouter);

const DB =
  "mongodb+srv://bravol:test12345@cluster0.nsxzpo3.mongodb.net/?retryWrites=true&w=majority";
//connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connected to the database");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () =>
  console.log(` Server connected on port ${PORT}!`)
);

//note
//creating API example
//GET, PUT, POST, DELETE, UPDATE-> CRUD
//http://<youripaddress>/hello-world
app.get("/hello-world", (req, res) => {
  //   res.send("Hello world"); // you get data in text format e,g hello world
  res.json({ name: "Brian" }); //you get data  in json format {"name": "Brian"}
});
