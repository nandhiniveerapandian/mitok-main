import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital/controllers/patient_controllers/token_controller.dart';

import 'homepage.dart';
import 'my_account.dart';
import '../patient/reusablewidget.dart';

class Token extends StatelessWidget {
  Token({Key? key}) : super(key: key);
  TokenController controller = Get.put(TokenController());
  @override
  Widget build(BuildContext context) {
    // controller.startTimer(900);
    return SafeArea(
      child: Scaffold(
        appBar: AppBarNav(),
        body: Center(
          child: GetBuilder<TokenController>(builder: (controller) {
            return Text("${controller.time}");
          }),
        ),
        bottomNavigationBar: bottomnavbar(),
      ),
    );
  }
}
