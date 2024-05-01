import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:user_ecom/controllers/sign_in_controller.dart';
import 'package:user_ecom/screens/admin-panel/admin_mian_screen.dart';
import 'package:user_ecom/screens/auth-ui/forget_password_screen.dart';
import 'package:user_ecom/screens/auth-ui/sign_up_screen.dart';
import 'package:user_ecom/utils/constant.dart';

import '../../controllers/get_user_data_controller.dart';
import '../user-panel/main_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController signInController = Get.put(SignInController());
  final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appScendoryColor,
          iconTheme: Theme.of(context).primaryIconTheme,
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
                      children: [
                        Lottie.asset('assets/images/splash-icon.json')
                      ],
                    ),
              SizedBox(height: Get.height / 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: userEmail,
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
                    child: Obx(
                      () => TextFormField(
                        controller: userPassword,
                        obscureText: signInController.isPasswordVisible.value,
                        cursorColor: AppConstant.appScendoryColor,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.password),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  signInController.isPasswordVisible.toggle();
                                },
                                child: signInController.isPasswordVisible.value
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)),
                            contentPadding:
                                const EdgeInsets.only(top: 2, left: 8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const ForgetPasswordScreen());
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerRight,
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(color: AppConstant.appScendoryColor),
                  ),
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
                    onPressed: () async {
                      String email = userEmail.text.trim();
                      String password = userPassword.text.trim();

                      if (email.isEmpty || password.isEmpty) {
                        Get.snackbar(
                          "Error",
                          "Please Enter All Details",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppConstant.appScendoryColor,
                          colorText: AppConstant.appTextColor,
                        );
                      } else {
                        UserCredential? userCredential = await signInController
                            .signInMethod(email, password);
                        var userData = await getUserDataController
                            .getUserData(userCredential!.user!.uid);
                        if (userCredential != null) {
                          if (userCredential.user!.emailVerified) {
                            if(userData[0]['isAdmin'] == true){
                              Get.offAll(()=> const AdminMainScreen());
                              Get.snackbar(
                                "Success Admin Login",
                                "Login Successfully",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appScendoryColor,
                                colorText: AppConstant.appTextColor,
                              );
                            }else{
                              Get.offAll(() => const MainScreen());
                              Get.snackbar(
                                "Success",
                                "Login Successfully",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appScendoryColor,
                                colorText: AppConstant.appTextColor,
                              );
                            }
                          } else {
                            Get.snackbar(
                              "Error",
                              "Please Verify the Email before login",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstant.appScendoryColor,
                              colorText: AppConstant.appTextColor,
                            );
                          }
                        } else {
                          Get.snackbar(
                            "Error",
                            "Please try again",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appScendoryColor,
                            colorText: AppConstant.appTextColor,
                          );
                        }
                      }
                    },
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
                      onTap: () {
                        Get.to(() => const SignUpScreen());
                      },
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
