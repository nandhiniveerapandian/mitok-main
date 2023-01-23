import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital/controllers/patient_controllers/home_page_controller.dart';
import 'package:hospital/controllers/patient_controllers/myaccount_controller.dart';
import 'package:hospital/main.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hospital/views/patient/token.dart';
import 'package:hospital/views/patient/homepage.dart';
import 'package:hospital/views/patient/hospital_details.dart';
import 'package:hospital/views/patient/hospitals.dart';
import 'package:hospital/views/patient/my_account.dart';

HomePageController controller = Get.put(HomePageController());
MyAccountController controller1 = Get.put(MyAccountController());
bottomnavbar() {
  return GetBuilder<HomePageController>(builder: (controller) {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      selectedLabelStyle:
          TextStyle(fontWeight: FontWeight.bold, fontSize: Get.height * 0.01),
      currentIndex: controller.indexes,
      // iconSize: 5,
      items: const [
        BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              size: 35,
            ),
            icon: Icon(
              Icons.home_outlined,
              size: 35,
            ),
            label: "_"),
        // BottomNavigationBarItem(
        //     activeIcon: Icon(
        //       Icons.calendar_month,
        //       size: 35,
        //     ),
        //     icon: Icon(
        //       Icons.calendar_month_outlined,
        //       size: 35,
        //     ),
        //     label: "_"),
        BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.confirmation_num,
              size: 35,
            ),
            icon: Icon(
              Icons.confirmation_num_outlined,
              size: 35,
            ),
            label: "_"),
        BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              size: 35,
            ),
            icon: Icon(
              Icons.person_outlined,
              size: 35,
            ),
            label: "_"),
      ],
      onTap: controller.indexchange,
      // ignore: prefer_const_constructors
      selectedIconTheme: IconThemeData(
        color: Colors.blue,
        size: 28,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.grey,
        size: 22,
      ),
    );
  });
}

AppBarNav() {
  return AppBar(
    title: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Text(
        'Hi, ${box.get('name')}',
        style:
            TextStyle(color: Color(0xff2549A1), fontSize: Get.height * 0.035),
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          // controller.checkServiceStatus();
        },
        icon: Icon(Icons.location_pin),
        color: Colors.grey[600],
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: controller1.imagefile == null
                    ? Image.network(
                        "${box.get('profile')}",
                      )
                    : Image.file(controller1.imagefile!))),
      ),
    ],
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(15),
      ),
    ),
  );
}
