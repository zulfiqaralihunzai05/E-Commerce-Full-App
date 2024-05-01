import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:user_ecom/utils/constant.dart';

import '../screens/auth-ui/forget_password_screen.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  Future<void> ForgetPasswordMethod(
      String userEmail,
      ) async {
    try {
      EasyLoading.show(status: "Please wait");
      await _auth.sendPasswordResetEmail(email: userEmail);
      Get.snackbar(
        "Request Sent Successfully ",
        "Password reset Link sent to $userEmail",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstant.appScendoryColor,
        colorText: AppConstant.appTextColor,
      );
      Get.offAll(() => const ForgetPasswordScreen());
      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        "Error",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstant.appScendoryColor,
        colorText: AppConstant.appTextColor,
      );
    }
  }
}