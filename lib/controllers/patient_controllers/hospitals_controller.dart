import 'dart:developer';

import 'package:get/get.dart';
import 'package:hospital/models/user.dart';

class HospitalsController extends GetxController {
  List<Doctor> docList = [
    Doctor(
      doc_name: 'Dr.Nivin',
      doc_img: "assets/images/profile.png",
      doc_hospital: 'Sooriya Hospital',
      doc_symptoms: ["Fever", "Cough", "Body Pain"],
      doc_specialization: 'Stomach',
      doc_slot_time: ['10-11 AM ', '12-1 PM', '2-3 PM', '4-5 PM'],
    ),
    Doctor(
      doc_name: 'Dr.Ashok',
      doc_img: "assets/images/profile.png",
      doc_hospital: 'Apollo Hospital',
      doc_symptoms: ["Fever", "Throat bubbles", "Ear Pain"],
      doc_specialization: 'ENT',
      doc_slot_time: ['9-10 AM', '11-12 AM', '1-2 PM', '2-3 PM', '4-5 PM'],
    ),
    Doctor(
      doc_name: 'Dr.Arun',
      doc_img: "assets/images/profile1.png",
      doc_hospital: 'Sooriya Hospital',
      doc_symptoms: ["Fever", "Throat bubbles", "Ear Pain"],
      doc_specialization: 'ENT',
      doc_slot_time: [
        '10-11 AM',
        '11-12 AM',
        '2-2.30 PM',
        '3-4 PM',
        '4-5 PM',
        '5-6 PM'
      ],
    ),
    Doctor(
      doc_name: 'Dr.Nivin',
      doc_img: "assets/images/profile.png",
      doc_hospital: 'Lifeline Hospital',
      doc_symptoms: ["Fever", "Cough", "Body Pain"],
      doc_specialization: 'Stomach',
      doc_slot_time: ['10-11 AM ', '12-1 PM', '2-3 PM', '4-5 PM'],
    ),
    Doctor(
      doc_name: 'Dr.Ashok',
      doc_img: "assets/images/profile1.png",
      doc_hospital: 'Apollo Hospital',
      doc_symptoms: ["Fever", "Throat bubbles", "Ear Pain"],
      doc_specialization: 'ENT',
      doc_slot_time: ['10-11 AM ', '11-12 AM', '1-2 PM', '2-3 PM', '4-5 PM'],
    ),
    Doctor(
      doc_name: 'Dr.Arun',
      doc_img: "assets/images/profile.png",
      doc_hospital: 'Sooriya Hospital',
      doc_symptoms: ["Fever", "Cough", "Body Pain"],
      doc_specialization: 'Stomach',
      doc_slot_time: ['10-11 AM ', '12-1 PM', '2-3 PM', '4-5 PM', '7-8 PM'],
    ),
    Doctor(
      doc_name: 'Dr.Nivin',
      doc_img: "assets/images/profile1.png",
      doc_hospital: 'Lifeline Hospital',
      doc_symptoms: ["Fever", "Cough", "Body Pain"],
      doc_specialization: 'Stomach',
      doc_slot_time: ['10-11 AM ', '12-1 PM', '2-3 PM', '4-5 PM'],
    ),
  ];

  List<Doctor> docListSearch({required String category, required String name}) {
    List<Doctor> searchedList =
        docList.where((element) => element.doc_name.contains(name)).toList();
    searchedList.forEach((element) => log(element.doc_name));
    update();
    return searchedList;
  }
}
