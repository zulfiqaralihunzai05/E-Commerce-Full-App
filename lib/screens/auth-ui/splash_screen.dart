import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:user_ecom/screens/auth-ui/welcome_screen.dart';
import 'package:user_ecom/screens/user-panel/main_screen.dart';
import 'package:user_ecom/utils/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
    Timer(const Duration(seconds: 3), ()  {
      Get.offAll(() => const WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppConstant.appScendoryColor,
      appBar: AppBar(
        backgroundColor: AppConstant.appScendoryColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: Get.width,
                alignment: Alignment.center,
                child: Lottie.asset('assets/images/splash-icon.json'),
              ),
            ),
            Container(
              width: Get.width,
              alignment: Alignment.center,
              child: const Text('E-Commerce', style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.center,
              child: const Text('Powered Bu ZeeDevs', style: TextStyle(fontSize: 15, color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
