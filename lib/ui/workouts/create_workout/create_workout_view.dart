import 'package:flutter/material.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'create_workout_viewmodel.dart';

class CreateWorkoutView extends StatelessWidget{
  final TPlan plan;
  final DateTime date;

  const CreateWorkoutView({
    Key? key,
    required this.plan,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateWorkoutViewModel>.reactive(
      viewModelBuilder: () => CreateWorkoutViewModel(plan: plan),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Select a workout'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                vSpaceMedium,
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: plan.workouts.length,
                  itemBuilder: (context, index) {
                    TWorkout workout = plan.workouts[index];
                    return Card(
                      child: ListTile(
                        title: Text(workout.name),
                        onTap: () => viewModel.selectWorkout(workout, date),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
