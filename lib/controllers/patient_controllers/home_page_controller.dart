import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hospital/models/category.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomePageController extends GetxController {
  bool show = true;
  bool expanded = false;
  int indexes = 0;

  indexchange(i) {
    indexes = i;
    update();
  }

  Search() {
    show = !show;
    update();
  }

  Expand() {
    expanded = !expanded;
    update();
  }

  int index() {
    if (expanded == true) {
      return categoryList.length;
    } else {
      return 9;
    }
  }

  double height() {
    if (expanded == true) {
      return Get.height * 0.66;
    } else {
      return Get.height * 0.5;
    }
  }

  Icon icon() {
    if (expanded == true) {
      return Icon(Icons.keyboard_arrow_up);
    } else {
      return Icon(Icons.keyboard_arrow_down);
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkServiceStatus();
    indexes = 0;
    indexchange(indexes);
  }

  late bool locationstatus;
  late LocationPermission permission;
  bool haspermission = false;
  String lat = "", long = '';
  late Position position;
  late StreamSubscription<Position> positionstream;
  List<Placemark> userlocation = [];
  String currentaddress = "";

  checkServiceStatus() async {
    locationstatus = await Geolocator.isLocationServiceEnabled();

    if (locationstatus) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        print("requesting for permission");
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print("permission denied");
        } else if (permission == LocationPermission.deniedForever) {}
      } else {
        haspermission = true;
        print("permission given already");
      }
    } else {
      print("permission given already");
      haspermission = true;
    }

    if (haspermission) {
      getLocation();
    }

    update();
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition();
    lat = position.latitude.toString();
    long = position.longitude.toString();

    try {
      positionstream = Geolocator.getPositionStream().listen((position) {
        lat = position.latitude.toString();
        long = position.longitude.toString();
      });
    } catch (e) {
      checkServiceStatus();
    }
    userlocation =
        await placemarkFromCoordinates(double.parse(lat), double.parse(long));
    Placemark place = userlocation.first;
    currentaddress =
        place.street.toString() + " " + place.postalCode.toString();
    update();
  }

  List<Category> categoryList = [
    Category(
      cat_name: 'General Fever',
      cat_img: "assets/images/fever.png",
      cat_color: Color(0xffD2FFF9),
    ),
    Category(
      cat_name: 'Stomach',
      cat_img: "assets/images/stomach.png",
      cat_color: Color(0xffFFC9C9),
    ),
    Category(
      cat_name: 'ENT',
      cat_img: "assets/images/listen.png",
      cat_color: Color(0xffF9F3DC),
    ),
    Category(
      cat_name: 'Cardiologist',
      cat_img: "assets/images/heart.png",
      cat_color: Color(0xffFFCFCF),
    ),
    Category(
      cat_name: 'Gynecologist',
      cat_img: "assets/images/pregnant.png",
      cat_color: Color(0xffF8D8EC),
    ),
    Category(
      cat_name: 'Ophthalmologist',
      cat_img: "assets/images/ophtalmology.png",
      cat_color: Color(0xffFADDC9),
    ),
    Category(
      cat_name: 'Orthopedist',
      cat_img: "assets/images/arthritis.png",
      cat_color: Color(0xffFFE5CF),
    ),
    Category(
      cat_name: 'Nephrologist',
      cat_img: "assets/images/urinary-tract.png",
      cat_color: Color(0xffFFD8CF),
    ),
    Category(
      cat_name: 'Dentist',
      cat_img: "assets/images/teeth.png",
      cat_color: Color(0xffCED5FF),
    ),
    Category(
      cat_name: 'Pulmonologist',
      cat_img: "assets/images/lungs.png",
      cat_color: Color(0xffFFCCD0),
    ),
    Category(
      cat_name: 'Radiologist',
      cat_img: "assets/images/x-ray.png",
      cat_color: Color(0xffCFFAFF),
    ),
    Category(
      cat_name: 'Neurologist',
      cat_img: "assets/images/brain.png",
      cat_color: Color(0xffFFE9D1),
    ),
    Category(
      cat_name: 'Naturopathic',
      cat_img: "assets/images/mortar.png",
      cat_color: Color(0xffFFEBCB),
    ),
    Category(
      cat_name: 'Veterinarian',
      cat_img: "assets/images/veterinarian.png",
      cat_color: Color(0xffCEFFDC),
    ),
  ];
}
