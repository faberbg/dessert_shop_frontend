import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dessert_shop/components/colors.dart';
import 'package:dessert_shop/uitls/app_dimensions.dart';
import 'package:dessert_shop/widgets/big_text.dart';
void showCustomSnackBar(String message, {bool isError = true, String title="Errors"}) {

  Get.snackbar(
      title,
      message,
      titleText: BigText(text: title, color: Colors.white),
      messageText: Text(message, style: TextStyle(
          color: Colors.white
      ),),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: isError?Colors.redAccent:AppColors.mainColor.withOpacity(0.5)
  );


}