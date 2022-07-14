import 'package:fitnessapp/app/modules/dailyprogram/views/exercises_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dailyprogram_controller.dart';

//günlük program anasayfası
class DailyprogramView extends GetView<DailyprogramController> {
  const DailyprogramView({Key? key}) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Scaffold(
          appBar: AppBar(
            title: const Text("DailyExercises"),
          ),
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              //egzersiz setlerinin gösterildiği kaydırmalı kısım
              ExercisesWidget(),
            ],
          ),
        ),
      );

  // SliverAppBar buildAppBar(BuildContext context) => SliverAppBar(
  //       expandedHeight: MediaQuery.of(context).size.height * 0.5,
  //       stretch: true,
  //       title: const Text('Statistics'),
  //       centerTitle: true,
  //       pinned: true,
  //       leading: const Icon(Icons.menu),
  //       actions: const [
  //         Icon(Icons.person, size: 28),
  //         SizedBox(width: 12),
  //       ],
  //     );
}
