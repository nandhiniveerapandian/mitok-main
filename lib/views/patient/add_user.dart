import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:get/get.dart';
import 'package:hospital/controllers/patient_controllers/add_user_controller.dart';
import 'package:hospital/controllers/patient_controllers/signup_controller.dart';

import '../../main.dart';

class AddUser extends StatelessWidget {
  AddUser({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AddUserController controller = Get.put(AddUserController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Add User',
              style: TextStyle(
                  color: Colors.black, fontSize: Get.textScaleFactor * 30),
            ),
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
          ),
          body: Form(
            key: formKey,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Get.height * 0.04, horizontal: Get.width * 0.06),
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            // width: Get.width * 1,
                            child: TextFormField(
                              controller: controller.userController,
                              decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  labelText: 'Username',
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: Get.textScaleFactor * 25,
                                      fontWeight: FontWeight.bold),
                                  hintText: '@name',
                                  hintStyle:
                                      TextStyle(height: Get.height * 0.003)),
                              validator: (value) {
                                return controller.validateUser(value!);
                              },
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: Get.width * 0.005,
                                color: Colors.black,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: Get.height * 0.015,
                                horizontal: Get.width * 0.03),
                            child: Image.asset(
                              "assets/images/user1.png",
                              width: Get.width * 0.07,
                              // height: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gender',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Get.textScaleFactor * 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Center(
                              child: GroupButton(
                                controller: controller.userGender,
                                options: GroupButtonOptions(
                                  direction: Axis.horizontal,
                                  spacing: Get.width * 0.03,
                                  buttonHeight: Get.height * 0.1,
                                  buttonWidth: Get.width * 0.2,
                                  mainGroupAlignment: MainGroupAlignment.start,
                                  crossGroupAlignment:
                                      CrossGroupAlignment.center,
                                  groupRunAlignment:
                                      GroupRunAlignment.spaceEvenly,
                                  borderRadius: BorderRadius.circular(50),
                                  unselectedBorderColor:
                                      Color.fromARGB(255, 5, 123, 219),
                                  // runSpacing: 10,
                                ),
                                buttons: const [
                                  'Male',
                                  'Female',
                                ],
                                isRadio: true,
                                onSelected: ((value, index, isSelected) {
                                  controller.usergender = value.toString();
                                }),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Get.textScaleFactor * 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Center(
                          child: GroupButton(
                            controller: controller.userAge,
                            options: GroupButtonOptions(
                              direction: Axis.horizontal,
                              spacing: Get.width * 0.03,
                              buttonHeight: Get.height * 0.04,
                              buttonWidth: Get.width * 0.17,
                              mainGroupAlignment: MainGroupAlignment.start,
                              crossGroupAlignment: CrossGroupAlignment.center,
                              groupRunAlignment: GroupRunAlignment.spaceEvenly,
                              borderRadius: BorderRadius.circular(25),

                              //unselectedBorderColor: Color(0xff2549A1),
                              unselectedBorderColor:
                                  Color.fromARGB(255, 5, 123, 219),
                              // runSpacing: 10,
                            ),
                            buttons: const [
                              'Below 3',
                              '4 - 12',
                              '12 - 20',
                              '21 - 30',
                              '31 - 50',
                              '51 - 70',
                              'Above 70'
                            ],
                            isRadio: true,
                            onSelected: ((value, index, isSelected) {
                              controller.agegroup = value.toString();
                            }),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.05,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width * 0.25,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color.fromARGB(
                                                  255, 26, 116, 252)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ))),
                                  onPressed: () {
                                    box.put(
                                        'name', controller.userController.text);
                                    box.put('agegroup', controller.agegroup);
                                    box.put(
                                        'usergender', controller.usergender);
                                    controller.Login(formKey);
                                  },
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                        fontSize: Get.textScaleFactor * 23),
                                  )),
                            ),
                            const Spacer(),
                            Expanded(
                              child: Image.asset(
                                "assets/images/boy.png",
                                // width: Get.width * 0.1,
                                height: Get.height * 0.35,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
                )),
          )),
    );
  }
}
