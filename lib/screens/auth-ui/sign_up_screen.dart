import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:user_ecom/screens/auth-ui/sign_in_screen.dart';

import '../../controllers/sign_up_controller.dart';
import '../../utils/constant.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController signupController = Get.put(SignUpController());
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userCity = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).primaryIconTheme,
          backgroundColor: AppConstant.appScendoryColor,
          centerTitle: true,
          title: const Text(
            'Sign Up',
            style: TextStyle(color: AppConstant.appTextColor),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: Get.height / 20),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Welcome to E-Commerce',
                  style: TextStyle(
                      color: AppConstant.appScendoryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
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
                  child: TextFormField(
                    controller: userName,
                    cursorColor: AppConstant.appScendoryColor,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        hintText: 'Username',
                        prefixIcon: const Icon(Icons.person),
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
                    controller: userPhone,
                    cursorColor: AppConstant.appScendoryColor,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: 'phone',
                        prefixIcon: const Icon(Icons.phone),
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
                    controller: userCity,
                    cursorColor: AppConstant.appScendoryColor,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        hintText: 'City',
                        prefixIcon: const Icon(Icons.location_city),
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
                        cursorColor: AppConstant.appScendoryColor,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: signupController.isPasswordVisible.value,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.password),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  signupController.isPasswordVisible.toggle();
                                },
                                child: signupController.isPasswordVisible.value
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)),
                            contentPadding:
                                const EdgeInsets.only(top: 2, left: 8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    )),
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
                      String name = userName.text.trim();
                      String email = userEmail.text.trim();
                      String phone = userPhone.text.trim();
                      String city = userCity.text.trim();
                      String password = userPassword.text.trim();
                      String userDeviceToken = '';

                      if (name.isEmpty ||
                          email.isEmpty ||
                          phone.isEmpty ||
                          city.isEmpty ||
                          password.isEmpty) {
                        Get.snackbar('Error', 'Please Enter all Details',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appScendoryColor,
                            colorText: AppConstant.appTextColor);
                      } else {
                        UserCredential? userCredential =
                           await signupController.signUpMethod(
                                name,
                                email,
                                phone,
                                city,
                                password,
                                userDeviceToken);
                        if(userCredential != null){
                          Get.snackbar('Verification email Sent', 'Please Check your email',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstant.appScendoryColor,
                              colorText: AppConstant.appTextColor);
                          FirebaseAuth.instance.signOut();
                          Get.offAll(()=> const SignInScreen());
                        }
                      }
                    },
                    child: const Text(
                      'Sign Up',
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
                    "Already have an account? ",
                    style: TextStyle(color: AppConstant.appScendoryColor),
                  ),
                  GestureDetector(
                    onTap: () => Get.offAll(() => const SignInScreen()),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          color: AppConstant.appScendoryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
