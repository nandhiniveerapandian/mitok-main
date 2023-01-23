import 'package:flutter/material.dart';
import 'package:hospital/controllers/patient_controllers/signup_controller.dart';
import 'package:hospital/views/patient/add_user.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);

  SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              "assets/images/mitok.png",
              width: Get.width * 0.3,
              // height: 160,
            ),
            Spacer(),
            Text(
              'Create a New Account',
              style: TextStyle(fontSize: Get.textScaleFactor * 35),
            ),
            SizedBox(height: Get.height * 0.07),
            SizedBox(
              width: Get.width * 0.75,
              child: TextButton(
                onPressed: () async {
                  await controller.signInWithGoogle();
                  controller.UserDet();
                  Get.to(() => AddUser());
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(color: Colors.black)))),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/google.png',
                      height: Get.width * 0.09,
                      // width: 40.0,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: Get.width * 0.03),
                        child: Text(
                          "Continue with Google",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Get.textScaleFactor * 24,
                              fontWeight: FontWeight.normal),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.01),
            Text(
              'or',
              style: TextStyle(
                  fontSize: Get.textScaleFactor * 27,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: Get.height * 0.01),
            SizedBox(
              width: Get.width * 0.75,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(color: Colors.black)))),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/facebook.png',
                      height: Get.width * 0.09,
                      // width: 40.0,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: Get.width * 0.03),
                        child: Text(
                          "Continue with Facebook",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Get.textScaleFactor * 24,
                              fontWeight: FontWeight.normal),
                        ))
                  ],
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: Get.width * 0.3),
              child: Image.asset(
                "assets/images/girl.png",
                width: Get.width * 0.5,
                height: Get.height * 0.35,
                alignment: Alignment.bottomLeft,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
