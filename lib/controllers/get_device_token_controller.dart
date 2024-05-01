import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:user_ecom/utils/constant.dart';

import '../screens/auth-ui/forget_password_screen.dart';

class GetDeviceTokenController extends GetxController {
  String? deviceToken;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDeviceToken();
  }

  Future<void> getDeviceToken() async{
    try{
      String? token = await FirebaseMessaging.instance.getToken();
      if(token != null){
        deviceToken = token;
        update();
      }
    }catch(e){
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