import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages, import_of_legacy_library_into_null_safe
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:hospital/views/patient/homepage.dart';
import 'package:hospital/views/patient/hospital_details.dart';
import 'package:hospital/views/patient/my_account.dart';
import 'package:hospital/views/patient/token.dart';
import 'package:intl/intl.dart';

import '../../main.dart';

class HosDetController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController selectedDate = TextEditingController();
  GroupButtonController userAge = GroupButtonController();
  GroupButtonController userGender = GroupButtonController();
  String? agegroup;
  String? usergender;
  // var selectedDate;
  // var selectedDate1;

  onInit() {
    userController = TextEditingController(text: box.get('username'));
    userEmail.text = box.get("email");
    agegroup = box.get('agegroup');
    usergender = box.get('usergender');
  }

  showDate(context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (date != null) {
      selectedDate.text = DateFormat.yMMMMd("en_US").format(date);
      update();
      // box.put('selectedDate', selectedDate);
    }
  }

  Create() {
    firebase.collection("token_book").doc(selectedDate.text + usergender!).set({
      "userController": userController.text,
      "userEmail": userEmail.text,
      "userAge": agegroup,
      "userGender": usergender,
      "selectedDate": selectedDate.text
    });
  }
}
