// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hospital/controllers/patient_controllers/home_page_controller.dart';

import 'package:hospital/controllers/patient_controllers/hospital_details_controller.dart';

// ignore: depend_on_referenced_packages, import_of_legacy_library_into_null_safe
import 'package:get/get.dart';
import 'package:hospital/controllers/patient_controllers/token_controller.dart';

import '../../main.dart';
import 'homepage.dart';

import '../patient/reusablewidget.dart';

class HosDet extends StatelessWidget {
  HosDet({Key? key}) : super(key: key);
  HosDetController controller = Get.put(HosDetController());
  TokenController controller1 = Get.put(TokenController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HosDetController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(Get.height * 0.25),
            child: AppBar(
              backgroundColor: Colors.transparent,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                    image: DecorationImage(
                        image: AssetImage('assets/images/hos.png'),
                        fit: BoxFit.cover)),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Get.height * 0.03, horizontal: Get.width * 0.05),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(
                        'Description',
                        style: TextStyle(fontSize: Get.height * 0.03),
                      ),
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                      RatingBar.builder(
                        initialRating: 0,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemSize: Get.width * 0.05,
                        itemCount: 5,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                    ]),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    Text(
                      'The ward is absolutely devoid of any sound. The silence is broken by the approaching footsteps of a physician or a nurse, or by the words of sympathy that they offer. Patients in a ward are overseen by both a physician and a nurse at all times.',
                      style: TextStyle(
                          fontSize: Get.height * 0.02,
                          color: Colors.black,
                          height: 1.3,
                          wordSpacing: 1,
                          letterSpacing: 0.1),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    Text('Specialization',
                        style: TextStyle(fontSize: Get.height * 0.025)),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    getSpecList(),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    Divider(
                      color: Colors.grey[400],
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    Row(
                      children: [
                        Text('Today Schedule',
                            style: TextStyle(fontSize: Get.height * 0.025)),
                        SizedBox(
                          width: Get.width * 0.025,
                        ),
                        TextButton.icon(
                          onPressed: () => {
                            controller.showDate(context),
                          },
                          icon: Icon(
                            Icons.calendar_month,
                            color: Colors.grey,
                          ),
                          label: Text(
                            'Select Date',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Text(
                      controller.selectedDate.text,
                      style: TextStyle(
                          color: Colors.blue, fontSize: Get.height * 0.022),
                    ),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    Text(
                      'Morning Slot',
                      style: TextStyle(fontSize: Get.height * 0.02),
                    ),
                    getmSlot(),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    Text(
                      'Afternoon Slot',
                      style: TextStyle(fontSize: Get.height * 0.02),
                    ),
                    getaSlot(),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    Text(
                      'Evening Slot',
                      style: TextStyle(fontSize: Get.height * 0.02),
                    ),
                    geteSlot(),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 26, 116, 252)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ))),
                          onPressed: () {
                            controller.Create();
                            controller1.startTimer(900);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  _buildPopupDialog(context),
                            );
                          },
                          child: Text(
                            'Book Appointment',
                            style: TextStyle(fontSize: Get.height * 0.025),
                          )),
                    ),
                  ]),
            ),
          ),
        ),
      );
    });
  }

  Widget getSpecList() {
    var spec = [
      'cardiologist',
      'dentist',
      'gynecologist',
      'neurologist',
      'ophthalmologist',
      'cardiologist',
      'dentist',
      'gynecologist',
      'neurologist',
      'ophthalmologist'
    ];
    var listView = Container(
        height: 20,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: spec.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Text(
              '${spec[index]}\t\t',
              style: TextStyle(fontSize: Get.height * 0.02),
            );
          },
        ));
    return listView;
  }

  Widget getmSlot() {
    var t = [
      '09:30 AM',
      '11.30 AM',
    ];
    var ta = [
      'Token Full',
      'Available Token 06',
    ];
    var listView = Container(
        height: Get.height * 0.08,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: t.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                SizedBox(
                  width: Get.width * 0.35, // specific value
                  height: Get.width * 0.12,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(color: Colors.black)),
                        )),
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(t[index],
                            style: TextStyle(
                                fontSize: Get.height * 0.025,
                                color: Colors.grey[500])),
                        Text(ta[index],
                            style: TextStyle(
                                fontSize: Get.height * 0.015,
                                color: Colors.grey[500])),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            );
          },
        ));
    return listView;
  }

  Widget getaSlot() {
    var t = [
      '02:30 PM',
      '04.30 PM',
    ];
    var ta = [
      'Available Token 08',
      'Available Token 05',
    ];
    var listView = Container(
        height: Get.height * 0.08,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: t.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                SizedBox(
                  width: Get.width * 0.35, // specific value
                  height: Get.width * 0.12,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(color: Colors.black)),
                        )),
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(t[index],
                            style: TextStyle(
                                fontSize: Get.height * 0.025,
                                color: Colors.grey[500])),
                        Text(ta[index],
                            style: TextStyle(
                                fontSize: Get.height * 0.015,
                                color: Colors.grey[500])),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            );
          },
        ));
    return listView;
  }

  Widget geteSlot() {
    var t = [
      '06:30 PM',
      '09.30 PM',
    ];
    var ta = [
      'Available Token 01',
      'Available Token 05',
    ];
    var listView = Container(
        height: Get.height * 0.08,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: t.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                SizedBox(
                  width: Get.width * 0.35, // specific value
                  height: Get.width * 0.12,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(color: Colors.black)),
                        )),
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(t[index],
                            style: TextStyle(
                                fontSize: Get.height * 0.025,
                                color: Colors.grey[500])),
                        Text(ta[index],
                            style: TextStyle(
                                fontSize: Get.height * 0.015,
                                color: Colors.grey[500])),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            );
          },
        ));
    return listView;
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('Token')),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: Get.height * 0.07,
                width: MediaQuery.of(context).size.width * 25,
                color: Color.fromARGB(255, 166, 205, 95),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Your token booked successfully',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: Get.height * 0.025),
                    ))),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Get.height * 0.02, horizontal: Get.width * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: Get.width * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Clinic Name',
                              style: TextStyle(fontSize: Get.height * 0.025),
                            ),
                            Text(
                              ':',
                              style: TextStyle(fontSize: Get.height * 0.025),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.025,
                      ),
                      Text(
                        'abc',
                        style: TextStyle(
                            fontSize: Get.height * 0.025, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        width: Get.width * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Doctor Name',
                              style: TextStyle(fontSize: Get.height * 0.025),
                            ),
                            Text(
                              ':',
                              style: TextStyle(fontSize: Get.height * 0.025),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.025,
                      ),
                      Text(
                        '@Dr.abc',
                        style: TextStyle(
                            fontSize: Get.height * 0.025, color: Colors.grey),
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
                              'Date / Day',
                              style: TextStyle(fontSize: Get.height * 0.025),
                            ),
                            Text(
                              ':',
                              style: TextStyle(fontSize: Get.height * 0.025),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.025,
                      ),
                      Text(
                        '@Date/Day',
                        style: TextStyle(
                            fontSize: Get.height * 0.025, color: Colors.grey),
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
                              'Slot Time',
                              style: TextStyle(fontSize: Get.height * 0.025),
                            ),
                            Text(
                              ':',
                              style: TextStyle(fontSize: Get.height * 0.025),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.025,
                      ),
                      Text(
                        '@time',
                        style: TextStyle(
                            fontSize: Get.height * 0.025, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: Get.width * 0.15,
                  backgroundColor: Color.fromARGB(255, 244, 190, 13),
                  child: CircleAvatar(
                    radius: Get.width * 0.145,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 254, 246, 249),
                      radius: Get.width * 0.135,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Get.height * 0.01),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Token no',
                              style: TextStyle(
                                  fontSize: Get.height * 0.015,
                                  color: Color.fromARGB(255, 244, 190, 13)),
                            ),
                            Text(
                              '07',
                              style: TextStyle(
                                  fontSize: Get.height * 0.06,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 244, 190, 13)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  radius: Get.width * 0.15,
                  backgroundColor: Color.fromARGB(255, 244, 190, 13),
                  child: CircleAvatar(
                    radius: Get.width * 0.145,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 254, 246, 249),
                      radius: Get.width * 0.135,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Get.height * 0.01),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Estimate Time',
                              style: TextStyle(
                                  fontSize: Get.height * 0.015,
                                  color: Color.fromARGB(255, 244, 190, 13)),
                            ),
                            Text(
                              '1h',
                              style: TextStyle(
                                  fontSize: Get.height * 0.06,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 244, 190, 13)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 26, 116, 252)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ))),
          onPressed: () {
            // Navigator.of(context).pop();
            Get.off(() => HomePage());
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
