// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/constants/error_handling.dart';
import 'package:flutter_amazon_clone/constants/global_variables.dart';
import 'package:flutter_amazon_clone/constants/utils.dart';
import 'package:flutter_amazon_clone/models/product.dart';
import 'package:flutter_amazon_clone/providers/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminServices {
  void sellProduct(
      {required BuildContext context,
      required String name,
      required double price,
      required String description,
      required double quantity,
      required String category,
      required List<File> images}) async {
    try {
      //
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final cloudinary = CloudinaryPublic('dnyn5tnzu', 'd1guxyuk');
      List<String> imageUrls = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);
      }
      Product product = Product(
        name: name,
        price: price,
        description: description,
        quantity: quantity,
        images: imageUrls,
        category: category,
      );
      http.Response response = await http.post(
        Uri.parse('$hostUrl/admin/add-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: product.toJson(),
      );
//handling success and errors
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(
              context,
              'Product added successfully',
            );
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
