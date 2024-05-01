import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_ecom/screens/auth-ui/welcome_screen.dart';
import 'package:user_ecom/utils/constant.dart';

import '../../widgets/drawer-widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appScendoryColor,
        centerTitle: true,
        iconTheme: Theme.of(context).primaryIconTheme,
        title: const Text('E-Commerce', style: TextStyle(color: Colors.white),),
        actions: [
        ],
      ),
      drawer: const DrawerWidget(),
      body: const Center(child: Text('Hello '),),

    );
  }
}
