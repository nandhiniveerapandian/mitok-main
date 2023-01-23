// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:hospital/main.dart';

import 'package:hospital/views/patient/homepage.dart';

class AddUserController extends GetxController {
  TextEditingController userController = TextEditingController();

  TextEditingController userEmail = TextEditingController();
  GroupButtonController userAge = GroupButtonController();
  GroupButtonController userGender = GroupButtonController();
  String? agegroup;
  String? usergender;

  @override
  void onInit() {
    super.onInit();
    userController = TextEditingController(text: box.get('username'));
    userEmail.text = box.get("email");
  }

  String? validateUser(String value) {
    if (value.length < 6) {
      return 'Enter username';
    }
    return null;
  }

  // ignore: non_constant_identifier_names
  void Login(GlobalKey<FormState> formKey) {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      Create();
      Get.offAll(() => HomePage());
    }
  }

  Create() {
    firebase.collection("add_user").doc(userController.text).set({
      "userController": userController.text,
      "userEmail": userEmail.text,
      "userAge": agegroup,
      "userGender": usergender,
    });
  }

  Update() {
    firebase.collection("add_user").doc(userController.text).update({
      "userEmail": userEmail.text,
    });
  }
}
