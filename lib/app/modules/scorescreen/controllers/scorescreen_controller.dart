import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScorescreenController extends GetxController {
  late double bmiScore;

  late int age;

  String? bmiStatus;

  String? bmiInterpretation;

  Color? bmiStatusColor;

  var data = Get.arguments;

  @override
  void onInit() {
    age = data[1]["age"];
    bmiScore = data[0]["bmiscore"];
    setBmiInterpretation();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setBmiInterpretation() {
    if (bmiScore > 30) {
      bmiStatus = "Obese";
      bmiInterpretation = "Please work to reduce obesity";
      bmiStatusColor = Colors.pink;
    } else if (bmiScore >= 25) {
      bmiStatus = "Overweight";
      bmiInterpretation = "Do regular exercise & reduce the weight";
      bmiStatusColor = Colors.orange;
    } else if (bmiScore >= 18.5) {
      bmiStatus = "Normal";
      bmiInterpretation = "Enjoy, You are fit";
      bmiStatusColor = Colors.green;
    } else if (bmiScore < 18.5) {
      bmiStatus = "Underweight";
      bmiInterpretation = "Try to increase the weight";
      bmiStatusColor = Colors.red;
    }
  }
}
