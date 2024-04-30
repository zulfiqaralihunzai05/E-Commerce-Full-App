import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:user_ecom/utils/constant.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppConstant.appScendoryColor,
        title: const Text(
          'Welcome to E-Commerce',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Lottie.asset(
                'assets/images/splash-icon.json',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: const Text(
                'Happy Shopping',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: Get.height / 12,
            ),
            Material(
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                    color: AppConstant.appScendoryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/final-google-logo.png',
                    width: Get.width / 12,
                    height: Get.height / 12,
                  ),
                  label: const Text(
                    'Sign in with Google',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Material(
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                    color: AppConstant.appScendoryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.email, color: Colors.white,),
                  label: const Text(
                    'Sign in with Email',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
