//creating APIs for admin

const express = require("express");
const admin = require("../middlewares/admin");
const Product = require("../models/product");
const adminRouter = express.Router();

// add product
adminRouter.post("/admin/add-product", admin, async (req, res) => {
  try {
    //req from users end
    const { name, price, description, quantity, images, category } = req.body;
    let product = new Product({
      name,
      description,
      images,
      quantity,
      price,
      category,
    });
    //save in database
    product = await product.save();
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
