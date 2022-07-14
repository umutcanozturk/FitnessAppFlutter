import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

import '../controllers/scorescreen_controller.dart';

//bmi score gösteren sayfa
class ScorescreenView extends GetView<ScorescreenController> {
  const ScorescreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Score"),
        backgroundColor: const Color(0xff3a434d),
      ),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: Card(
              elevation: 12,
              shape: const RoundedRectangleBorder(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Your Score",
                      style: TextStyle(fontSize: 30, color: Color(0xff3a434d)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrettyGauge(
                      gaugeSize: 300,
                      minValue: 0,
                      maxValue: 40,
                      segments: [
                        //grafik durumları
                        GaugeSegment('UnderWeight', 18.5, Colors.red),
                        GaugeSegment('Normal', 6.4, Colors.green),
                        GaugeSegment('OverWeight', 5, Colors.orange),
                        GaugeSegment('Obese', 10.1, Colors.pink),
                      ],
                      valueWidget: Text(
                        controller.bmiScore.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 40),
                      ),
                      currentValue: controller.bmiScore.toDouble(),
                      needleColor: const Color(0xff3a434d),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.bmiStatus!,
                      style: TextStyle(
                          fontSize: 20, color: controller.bmiStatusColor!),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.bmiInterpretation!,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xff3a434d)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Re-calculate")),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xff3a434d)),
                            onPressed: () {
                              Share.share(
                                  "Your BMI is ${controller.bmiScore.toStringAsFixed(1)} at age $controller.age");
                            },
                            child: const Text("Share")),
                      ],
                    )
                  ]))),
    );
  }
}
