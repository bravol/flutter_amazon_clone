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
      name: name,
      description: description,
      images: images,
      quantity: quantity,
      price: price,
      category: category,
    });
    //save in database
    product = await product.save();
    //returning rpduct to the client side
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//get all the products
adminRouter.get("/admin/get-products", admin, async (req, res) => {
  try {
    const products = await Product.find({});
    //return products to client
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//create a route to delete the product
adminRouter.delete("/admin/delete-product", admin, async (req, res) => {
  try {
    const { id } = req.body;
    let product = await Product.findByIdAndDelete(id);
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = adminRouter;
