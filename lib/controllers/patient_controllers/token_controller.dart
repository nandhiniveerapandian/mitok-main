import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TokenController extends GetxController {
  Timer? timer;
  int remainingSeconds = 1;
  var time = '00.00';

  @override
  void onInit() {
    // startTimer(900);
    super.onInit();
  }

  @override
  void onClose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.onClose();
  }

  startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        // print(time);

        timer.cancel();
        update();
      } else {
        // print(time);
        int minutes = remainingSeconds ~/ 60;
        int seconds = remainingSeconds % 60;
        time = (minutes.toString().padLeft(2, "0") +
            ":" +
            seconds.toString().padLeft(2, "0"));
        remainingSeconds--;
        update();
      }
    });
    update();
  }
}
