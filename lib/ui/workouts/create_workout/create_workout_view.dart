import 'package:flutter/material.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/ui/dumb_widgets/custom_app_bar.dart';
import 'package:gymnotes/ui/dumb_widgets/responsive_card.dart';
import 'package:gymnotes/ui/dumb_widgets/rounded_box.dart';
import 'package:gymnotes/ui/dumb_widgets/rounded_button.dart';
import 'package:gymnotes/ui/shared/styles.dart';
import 'package:gymnotes/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';

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
          appBar: getAppBar('Select a Workout', []),
          body: ResponsiveCard(
            child: Column(
              children: [
                Wrap(
                  children: [
                    const Text(
                      'Your current training plan is ',
                      style: TextStyle(
                        fontSize: 25,
                        color: kcForegroundColor,
                      ),
                    ),
                    Text(
                      plan.name,
                      style: const TextStyle(
                        fontSize: 25,
                        color: kcPrimaryColor,
                      ),
                    ),
                  ]
                ),
                vSpaceRegular,
                Text(
                  'Select a workout for ${DateFormat('EEEE, dd.MM.yyyy').format(date)}',
                  style: const TextStyle(
                    color: kcForegroundColor,
                  ),
                ),
                vSpaceRegular,
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: plan.workouts.length,
                  separatorBuilder: (context, index) => vSpaceSmall,
                  itemBuilder: (context, index) {
                    TWorkout workout = plan.workouts[index];
                    return RoundedButton(
                      onPressed: () => viewModel.selectWorkout(workout, date),
                      color: kcSecondaryColor,
                      child: Text(workout.name),
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
