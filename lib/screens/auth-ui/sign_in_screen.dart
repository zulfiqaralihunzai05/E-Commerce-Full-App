import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:user_ecom/screens/auth-ui/sign_up_screen.dart';
import 'package:user_ecom/utils/constant.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appScendoryColor,
          centerTitle: true,
          title: const Text(
            'Sign In',
            style: TextStyle(color: AppConstant.appTextColor),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              isKeyboardVisible
                  ? const Text('Welcome to E-Commerce')
                  : Column(
                      children: [Lottie.asset('assets/images/splash-icon.json')],
                    ),
              SizedBox(height: Get.height / 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: AppConstant.appScendoryColor,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        contentPadding: const EdgeInsets.only(top: 2, left: 8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: AppConstant.appScendoryColor,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: const Icon(Icons.visibility_off),
                        contentPadding: const EdgeInsets.only(top: 2, left: 8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerRight,
                child: const Text(
                  'Forget Password?',
                  style: TextStyle(color: AppConstant.appScendoryColor),
                ),
              ),
              SizedBox(height: Get.height / 20),
              Material(
                child: Container(
                  width: Get.width / 2,
                  height: Get.height / 15,
                  decoration: BoxDecoration(
                      color: AppConstant.appScendoryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height / 27),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: AppConstant.appScendoryColor),
                  ),
                  GestureDetector(
                    onTap: ()=> Get.offAll(() => const SignUpScreen()),
                      child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        color: AppConstant.appScendoryColor,
                        fontWeight: FontWeight.bold),
                  )),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
