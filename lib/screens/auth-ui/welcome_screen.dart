import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:user_ecom/screens/auth-ui/sign_in_screen.dart';
import 'package:user_ecom/utils/constant.dart';

import '../../controllers/google_sign_in_controller.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  final GoogleSignInController googleSignInController = Get.put(GoogleSignInController());

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Lottie.asset(
              'assets/images/splash-icon.json',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
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
                onPressed: () {
                  googleSignInController.signInWithGoogle();
                },
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
          const SizedBox(height: 10,),
          Material(
            child: Container(
              width: Get.width / 1.2,
              height: Get.height / 12,
              decoration: BoxDecoration(
                  color: AppConstant.appScendoryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton.icon(
                onPressed: () {
                  Get.to(() => const SignInScreen());
                },
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
    );
  }
}
