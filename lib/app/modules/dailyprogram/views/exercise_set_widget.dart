import 'package:fitnessapp/app/modules/dailyprogram/views/exercise_page.dart';
import 'package:flutter/material.dart';

import '../../../models/exercise_set.dart';

//setleri gösterdiğimiz widget
class ExerciseSetWidget extends StatelessWidget {
  final ExerciseSet exerciseSet;

  const ExerciseSetWidget({
    required this.exerciseSet,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ExercisePage(exerciseSet: exerciseSet),
        )),
        child: Container(
          padding: const EdgeInsets.all(16),
          height: 100,
          decoration: BoxDecoration(
            color: exerciseSet.color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Expanded(flex: 3, child: buildText()),
              Expanded(child: Image.asset(exerciseSet.imageUrl))
            ],
          ),
        ),
      );

  Widget buildText() {
    final exercises = exerciseSet.exercises.length;
    final minutes = exerciseSet.totalDuration;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          exerciseSet.name,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        const SizedBox(height: 10),
        Text('$exercises Exercises $minutes Mins'),
      ],
    );
  }
}
