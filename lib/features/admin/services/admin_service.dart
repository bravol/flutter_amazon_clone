import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/constants/utils.dart';

class AdminServices {
  void sellProduct(
      {required BuildContext context,
      required String name,
      required String price,
      required String description,
      required double quantity,
      required String category,
      required List<File> images}) async {
    try {} catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
