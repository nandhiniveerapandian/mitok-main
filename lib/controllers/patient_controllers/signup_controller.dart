import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hospital/views/patient/homepage.dart';
import 'package:hospital/views/patient/signup.dart';

import 'package:hospital/main.dart';

class SignupController extends GetxController {
  TextEditingController userEmail = TextEditingController();
  void onInit() async {
    super.onInit();
    LoginStatus();
    UserDet();
    userEmail = TextEditingController(text: box.get('email'));
  }

  UserDet() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final username = user.displayName;
      final profile = user.photoURL;
      final email = user.email;
      // print(username);
      box.put('username', username);
      box.put('profile', profile);

      box.put('email', email);
    }
  }

  LoginStatus() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Get.offAll(() => Signup());
      } else {
        Get.offAll(() => HomePage());
      }
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
