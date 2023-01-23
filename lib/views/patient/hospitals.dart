import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hospital/controllers/patient_controllers/hospitals_controller.dart';
import 'package:hospital/models/user.dart';
import 'package:hospital/views/patient/hospital_details.dart';

class Hospitals extends StatelessWidget {
  String category;
  String name = '';
  Hospitals({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HospitalsController controller = Get.put(HospitalsController());

    TextEditingController textController = TextEditingController();
    List<Doctor> docList =
        controller.docListSearch(category: category, name: name);

    var h = Get.height;
    var w = Get.width;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.025, horizontal: Get.width * 0.02),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: w * 0.05),
              child: AnimatedSearchBar(
                label: "Search",
                searchDecoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                labelStyle: TextStyle(
                    fontSize: Get.height * 0.03, color: Color(0xff2549A1)),
                onChanged: (value) {
                  docList =
                      controller.docListSearch(category: category, name: value);
                },
              ),
            ),
            SizedBox(
              height: h * 0.82,
              child: GetBuilder<HospitalsController>(builder: (controller) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: docList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: h * 0.02, horizontal: w * 0.02),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.05,
                                    vertical: Get.height * 0.02),
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        docList[index].doc_img,
                                        width: w * 0.15,
                                      ),
                                      SizedBox(
                                        width: w * 0.05,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              docList[index].doc_name,
                                              maxLines: 1,
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: Get.height * 0.018,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.01,
                                            ),
                                            Text(
                                              docList[index].doc_hospital,
                                              maxLines: 1,
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: Get.height * 0.018,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.01,
                                            ),
                                            RatingBar.builder(
                                              initialRating: 0,
                                              minRating: 0,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemSize: Get.height * 0.018,
                                              itemCount: 5,
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {},
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.01,
                                            ),
                                            Text(
                                              'Available Slots',
                                              maxLines: 1,
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: Get.height * 0.018,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.01,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Get.to(() => HosDet());
                                              },
                                              style: TextButton.styleFrom(
                                                  foregroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              32.0)),
                                                  minimumSize:
                                                      const Size(75, 10),
                                                  elevation: 2,
                                                  backgroundColor: Colors.blue),
                                              child: const Text('Book'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Wrap(
                                      children: docList[index]
                                          .doc_slot_time
                                          .map((e) => Container(
                                                alignment: Alignment.center,
                                                width: Get.width * 0.2,
                                                height: Get.height * 0.03,
                                                margin: const EdgeInsets.all(3),
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    border: Border.all(
                                                        color: Colors.grey)),
                                                child: Text(
                                                  e,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize:
                                                          Get.height * 0.018),
                                                ),
                                              ))
                                          .toList())
                                ]),
                              )));
                    });
              }),
            ),
          ],
        ),
      ),
    ));
  }
}
