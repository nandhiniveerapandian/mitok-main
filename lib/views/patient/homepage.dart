import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital/controllers/patient_controllers/home_page_controller.dart';
import 'package:hospital/views/patient/my_account.dart';
import 'package:hospital/views/patient/reusablewidget.dart';
import 'package:hospital/views/patient/token.dart';
import 'package:hospital/views/patient/hospitals.dart';
import 'package:hospital/views/patient/schedule.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final pages = [
    Home(),
    // Schedule(),
    Token(),
    MyAccount(),
  ];
  HomePageController controller = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (controller) {
      return SizedBox(
        child: pages[controller.indexes],
      );
    });
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBarNav(),
        body: Container(
          margin: EdgeInsets.symmetric(
              vertical: Get.height * 0.01, horizontal: Get.width * 0.02),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Get.height * 0.01, horizontal: Get.width * 0.05),
                child: Row(
                  children: [
                    Text(
                      'Find the Right Specialist',
                      style: TextStyle(
                          fontSize: Get.height * 0.025,
                          color: Color(0xff2549A1)),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Get.to(() => Hospitals(category: ''));
                      },
                      icon: Icon(Icons.search),
                      color: Colors.grey[600],
                    ),
                  ],
                ),
              ),
              GetBuilder<HomePageController>(builder: (controller) {
                return Container(
                  // color: Colors.grey[200],
                  height: controller.height(),
                  width: Get.width,
                  child: GridView.builder(
                    itemCount: controller.index(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 1.0,
                        mainAxisSpacing: 1.0),
                    itemBuilder: (BuildContext context, int index) {
                      return CategoryWidget(
                          category: controller.categoryList[index].cat_name,
                          color: controller.categoryList[index].cat_color,
                          path: controller.categoryList[index].cat_img);
                    },
                  ),
                );
              }),
              GetBuilder<HomePageController>(builder: (controller) {
                return Row(
                  children: [
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          controller.Expand();
                        },
                        icon: controller.icon())
                  ],
                );
              }),
              CarouselSlider(
                items: [
                  Container(
                    margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('assets/images/doc2.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('assets/images/doc1.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('assets/images/doc2.png'),
                          fit: BoxFit.fill),
                    ),
                  )
                ],
                options: CarouselOptions(
                    height: Get.height * 0.22,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true),
              ),
            ],
          ),
        ),
        bottomNavigationBar: bottomnavbar(),
      ),
    );
  }
}

Widget CategoryWidget(
    {required String category, required Color color, required String path}) {
  return Column(
    children: [
      TextButton(
        onPressed: () {
          Get.to(() => Hospitals(
                category: category,
              ));
        },
        child: Container(
          width: Get.width * 0.18,
          height: Get.height * 0.09,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50.0),
            boxShadow: [
              const BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              path,
              // width: 40,
              height: Get.height * 0.055,
            ),
          ),
        ),
      ),
      Text(category),
    ],
  );
}
