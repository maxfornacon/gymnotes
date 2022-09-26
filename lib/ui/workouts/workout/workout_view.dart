import 'package:flutter/material.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/ui/dumb_widgets/custom_app_bar.dart';
import 'package:gymnotes/ui/dumb_widgets/responsive_card.dart';
import 'package:gymnotes/ui/dumb_widgets/rounded_box.dart';
import 'package:gymnotes/ui/dumb_widgets/rounded_button.dart';
import 'package:gymnotes/ui/shared/styles.dart';
import 'package:gymnotes/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'workout_viewmodel.dart';

class WorkoutView extends StatelessWidget {
  final Workout workout;

  const WorkoutView({
    Key? key,
    required this.workout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WorkoutViewModel>.reactive(
      viewModelBuilder: () => WorkoutViewModel(workout: workout),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: getAppBar(workout.name,  [
          IconButton(
            onPressed: () => model.deleteWorkout(),
            icon: const Icon(
              Icons.delete,
              color: kcForegroundColor,
            ),
            tooltip: 'Delete workout',
          ),
        ],),
        body: ResponsiveCard(
          child: PageView.builder(
            controller: model.pageController,
            pageSnapping: true,
            itemCount: model.exercises.length,
            itemBuilder: (context, index) {
              final exercise = model.exercises[index];
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () => model.previousPage(),
                        color: kcForegroundColor,
                      ),
                      Text(
                        exercise.name,
                        style: const TextStyle(
                          color: kcForegroundColor,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () => model.nextPage(),
                        color: kcForegroundColor,
                      ),
                    ],
                  ),
                  vSpaceRegular,
                  RoundedBox(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Weight (${exercise.unit})',
                            style: const TextStyle(
                              fontSize: 16,
                              color: kcForegroundColor,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 35,
                              child: RoundedButton(
                                onPressed: () => model.decrementWeight(exercise),
                                borderRadius: BorderRadius.circular(5),
                                height: 35,
                                child: Text(
                                  '-${exercise.weightIncrement}',
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            hSpaceTiny,
                            SizedBox(
                              width: 70,
                              child: TextField(
                                controller: model.weightController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(10),
                                  fillColor: Colors.white10,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent
                                    ),
                                  ),
                                ),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: kcForegroundColor,
                                ),
                                cursorColor: kcPrimaryColor,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            hSpaceTiny,
                            SizedBox(
                              width: 35,
                              child: RoundedButton(
                                onPressed: () => model.incrementWeight(exercise),
                                borderRadius: BorderRadius.circular(5),
                                height: 35,
                                child: Text(
                                  '+${exercise.weightIncrement}',
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Reps',
                            style: TextStyle(
                              fontSize: 16,
                              color: kcForegroundColor,
                            ),
                          ),
                        ),
                        vSpaceSmall,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 35,
                              child: RoundedButton(
                                onPressed: () => model.decrementReps(),
                                borderRadius: BorderRadius.circular(5),
                                height: 35,
                                child: const Text(
                                  '-',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            hSpaceTiny,
                            SizedBox(
                              width: 70,
                              child: TextField(
                                controller: model.repsController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(10),
                                  fillColor: Colors.white10,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent
                                    ),
                                  ),
                                ),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: kcForegroundColor,
                                ),
                                cursorColor: kcPrimaryColor,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            hSpaceTiny,
                            SizedBox(
                              width: 35,
                              child: RoundedButton(
                                onPressed: () => model.incrementReps(),
                                borderRadius: BorderRadius.circular(5),
                                height: 35,
                                child: const Text(
                                  '+',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ),
                  vSpaceSmall,
                  RoundedButton(
                    onPressed: () => model.addSet(
                      exercise: exercise,
                      workoutId: workout.id,
                    ),
                    child: const Text('Add Set'),
                  ),
                  vSpaceRegular,
                  if (exercise.sets != null) ListView.separated(
                    shrinkWrap: true,
                    itemCount: exercise.sets!.length,
                    itemBuilder: (context, index) {
                      final set = exercise.sets![index];
                      return RoundedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${set.index}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: kcForegroundColor,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${set.weight} ',
                                  style: const TextStyle(
                                    color: kcForegroundColor,
                                  ),
                                ),
                                Text(
                                  exercise.unit,
                                  style: ktsMediumGreyBodyText.copyWith(
                                    fontSize: 12,
                                  )
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${set.reps} ',
                                  style: const TextStyle(
                                    color: kcForegroundColor,
                                  ),
                                ),
                                Text(
                                  'reps',
                                  style: ktsMediumGreyBodyText.copyWith(
                                    fontSize: 12,
                                  )
                                ),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: kcForegroundColor,
                              ),
                              onPressed: () => model.deleteSet(exercise: exercise, set: set),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => vSpaceSmall,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}