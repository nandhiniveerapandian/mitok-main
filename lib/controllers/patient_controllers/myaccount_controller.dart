import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hospital/main.dart';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class MyAccountController extends GetxController {
  TextEditingController userName = TextEditingController();

  File? imagefile;
  ImagePicker _picker = ImagePicker();
  @override
  void onInit() {
    super.onInit();
    userName = TextEditingController(text: box.get('name'));
  }

  void takePhoto(ImageSource source) async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    imagefile = File(photo!.path);
    update();
    // box.put('prof', imagefile);
  }

  void choosePhoto(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    imagefile = File(image!.path);
    update();
    // box.put('prof', imagefile);
  }
}
