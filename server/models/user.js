const mongoose = require("mongoose");
const { productSchema } = require("./product");

const userSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  email: {
    type: String,
    required: true,
    trim: true,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;

        return value.match(re);
      },
      message: "Please enter a valid email address",
    },
  },
  //password
  password: {
    type: String,
    required: true,
    validate: {
      validator: (value) => {
        return value.length >= 6;
      },
      message: "Please enter a password with 6 or more characters",
    },
  },

  address: {
    type: String,
    default: "",
  },

  type: {
    type: String,
    default: "user",
  },
  //cart
  cart: [
    {
      product: productSchema,
      quantity: {
        type: Number,
        required: true,
      },
    },
  ],
});

//creating a model
const User = mongoose.model("User", userSchema);
//export
module.exports = User;
