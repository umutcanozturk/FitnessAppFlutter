import 'dart:math';

import 'package:fitnessapp/app/modules/bmicalculator/views/age_weight_widget.dart';
import 'package:fitnessapp/app/modules/bmicalculator/views/gender_widget.dart';
import 'package:fitnessapp/app/modules/bmicalculator/views/height_widget.dart';
import 'package:fitnessapp/app/modules/scorescreen/views/scorescreen_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:get/get.dart';
import '../controllers/bmicalculator_controller.dart';

//bmi anasayfası
class BmicalculatorView extends GetView<BmicalculatorController> {
  const BmicalculatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("BMI Calculator"),
          backgroundColor: const Color(0xff3a434d),
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          color: Colors.orange,
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          child: Card(
            elevation: 11,
            shape: const RoundedRectangleBorder(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //cinsiyet seçimiyle ilgili kısım
                GenderWidget(
                  onChange: (genderVal) {
                    controller.gender.value = genderVal;
                  },
                ),
                HeightWidget(
                  onChange: (heightVal) {
                    controller.height.value = heightVal;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //yaş ve ağırlık seçimi yapılan kısım
                    AgeWeightWidget(
                        onChange: (ageVal) {
                          controller.age.value = ageVal;
                        },
                        title: "Age",
                        initValue: 30,
                        min: 0,
                        max: 100),
                    AgeWeightWidget(
                        onChange: (weightVal) {
                          controller.weight.value = weightVal;
                        },
                        title: "Weight(Kg)",
                        initValue: 50,
                        min: 0,
                        max: 200)
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                  child: FloatingActionButton(
                    //hesaplama yapıp sonuç sayfasına yönlendiren kısım
                    backgroundColor: const Color(0xff3a434d),
                    child: const Icon(Icons.arrow_forward_rounded),
                    onPressed: () async {
                      RxStatus.loading();
                      await Future.delayed(const Duration(seconds: 1), () {
                        calculateBmi();
                      });
                      RxStatus.success();
                      await Get.toNamed(
                        "/scorescreen",
                        arguments: [
                          {"bmiscore": controller.bmiScore.value},
                          {"age": controller.age.value}
                        ],
                      );

                      controller.isFinished.value = false;
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }

//kğtle endeksi hesaplayan fonksiyon
  void calculateBmi() {
    controller.bmiScore.value =
        controller.weight.value / pow(controller.height.value / 100, 2);
  }
}
