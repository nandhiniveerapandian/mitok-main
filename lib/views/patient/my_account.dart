import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hospital/controllers/patient_controllers/myaccount_controller.dart';
import 'package:hospital/controllers/patient_controllers/signup_controller.dart';
import 'package:hospital/views/patient/signup.dart';
import 'package:hospital/controllers/patient_controllers/add_user_controller.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:hospital/signup/signup.dart';

import '../../main.dart';
import '../patient/reusablewidget.dart';

class MyAccount extends StatelessWidget {
  MyAccount({Key? key}) : super(key: key);
  AddUserController controller = Get.put(AddUserController());
  // SignupController controller1 = Get.put(SignupController());
  MyAccountController controller2 = Get.put(MyAccountController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(fontSize: Get.height * 0.03),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Get.height * 0.1, horizontal: Get.width * 0.08),
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GetBuilder<MyAccountController>(builder: (controller) {
                    return imageProfile(context);
                  }),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    'My Account',
                    style: TextStyle(
                        color: Color(0xff2549A1), fontSize: Get.height * 0.045),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Row(
                    children: [
                      Container(
                        width: Get.width * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Username',
                              style: TextStyle(fontSize: Get.height * 0.027),
                            ),
                            Text(
                              ':',
                              style: TextStyle(fontSize: Get.height * 0.027),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.03,
                      ),
                      Text(
                        '${box.get('name')}',
                        style: TextStyle(
                            fontSize: Get.height * 0.023, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.025,
                  ),
                  Row(
                    children: [
                      Container(
                        width: Get.width * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(fontSize: Get.height * 0.027),
                            ),
                            Text(
                              ':',
                              style: TextStyle(fontSize: Get.height * 0.027),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.03,
                      ),
                      Expanded(
                        child: Text(
                          '${box.get('email')}',
                          style: TextStyle(
                              fontSize: Get.height * 0.023, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.025,
                  ),
                  Row(
                    children: [
                      Container(
                        width: Get.width * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Gender',
                              style: TextStyle(fontSize: Get.height * 0.027),
                            ),
                            Text(
                              ':',
                              style: TextStyle(fontSize: Get.height * 0.027),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.03,
                      ),
                      Text(
                        '${box.get('usergender')}',
                        style: TextStyle(
                            fontSize: Get.height * 0.023, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.025,
                  ),
                  Row(
                    children: [
                      Container(
                        width: Get.width * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Age Group',
                              style: TextStyle(fontSize: Get.height * 0.027),
                            ),
                            Text(
                              ':',
                              style: TextStyle(fontSize: Get.height * 0.027),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.03,
                      ),
                      Text(
                        '${box.get('agegroup')}',
                        style: TextStyle(
                            fontSize: Get.height * 0.023, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  _buildPopupDialog(context),
                            );
                          },
                          child: Text('Edit Profile',
                              style: TextStyle(fontSize: Get.height * 0.02))),
                      ElevatedButton(
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            await GoogleSignIn().signOut();
                            // box.clear();
                            Get.offAll(() => Signup());
                          },
                          child: Text('Signout',
                              style: TextStyle(fontSize: Get.height * 0.02))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: bottomnavbar(),
      ),
    );
  }

  Widget imageProfile(context) {
    return Center(
      child: Stack(
        children: <Widget>[
          controller2.imagefile == null
              ? ClipOval(
                  child: Image.network(
                    "${box.get('profile')}",
                  ),
                )
              : ClipOval(
                  child: SizedBox(
                      height: Get.height * 0.1,
                      width: Get.width * 0.3,
                      child: Image.file(controller2.imagefile!))),
          Positioned(
              bottom: 2,
              right: 5,
              child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: ((builder) => bottomSheet(context)));
                  },
                  child: const Icon(Icons.camera_alt)))
        ],
      ),
    );
  }

  Widget bottomSheet(context) {
    return Container(
      height: Get.height * 0.12,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
          horizontal: Get.width * 0.05, vertical: Get.height * 0.03),
      child: Column(children: [
        Text(
          'Choose Profile Photo',
          style: TextStyle(fontSize: Get.height * 0.025),
        ),
        SizedBox(
          height: Get.height * 0.025,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ElevatedButton.icon(
            onPressed: () {
              controller2.takePhoto(ImageSource.camera);
            },
            icon: Icon(Icons.camera),
            label: Text('Camera'),
            style: ElevatedButton.styleFrom(
                // backgroundColor:
                ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              controller2.choosePhoto(ImageSource.gallery);
            },
            icon: Icon(Icons.image),
            label: Text('Gallery'),
            style: ElevatedButton.styleFrom(
                // backgroundColor:
                ),
          ),
        ])
      ]),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('Edit Profile')),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  "${box.get('profile')}",
                ),
              ),
            ),
            TextFormField(
              controller: controller2.userName,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Username',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: Get.height * 0.025,
                      fontWeight: FontWeight.bold),
                  hintText: '@name',
                  hintStyle: TextStyle(height: Get.height * 0.0025)),
              validator: (value) {
                return controller.validateUser(value!);
              },
            ),
            TextFormField(
              controller: controller.userEmail,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: Get.height * 0.025,
                      fontWeight: FontWeight.bold),
                  hintText: '@email',
                  hintStyle: TextStyle(height: Get.height * 0.0025)),
              validator: (value) {
                return controller.validateUser(value!);
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            controller.Update();
            // Navigator.of(context).pop();
          },
          child: const Text('Update'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
