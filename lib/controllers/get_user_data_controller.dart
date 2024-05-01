import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:user_ecom/utils/constant.dart';

import '../screens/auth-ui/forget_password_screen.dart';

class GetUserDataController extends GetxController {
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Object?>>> getUserData(String uId) async{
    final QuerySnapshot userData = await _firestore.collection('users').where('uId', isEqualTo: uId).get();
    return userData.docs;

  }
}