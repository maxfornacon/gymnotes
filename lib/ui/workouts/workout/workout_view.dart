import 'package:flutter/material.dart';
import 'package:gymnotes/models/application_models.dart';
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
        appBar: AppBar(
          title: Text(workout.name),
          actions: [
            IconButton(
              onPressed: () => model.deleteWorkout(),
              icon: const Icon(Icons.delete),
              tooltip: 'Delete workout',
            ),
          ],
        ),
        body: PageView.builder(
          controller: model.pageController,
          pageSnapping: true,
          itemCount: model.exercises.length,
          itemBuilder: (context, index) {
            final exercise = model.exercises[index];
            return Card(
              margin: const EdgeInsets.all(25),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () => model.previousPage(),
                        ),
                        Text(
                          exercise.name,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios),
                          onPressed: () => model.nextPage(),
                        ),
                      ],
                    ),
                    vSpaceRegular,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Weight (${exercise.unit})',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    vSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () => model.decrementWeight(exercise),
                          color: Colors.blue,
                          padding: EdgeInsets.zero,
                          height: 45,
                          minWidth: 45,
                          child: Stack(
                            children: [
                              const Icon(Icons.remove),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    '${exercise.weightIncrement}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        hSpaceTiny,
                        SizedBox(
                          width: 70,
                          child: TextField(
                            controller: model.weightController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        hSpaceTiny,
                        MaterialButton(
                          onPressed: () => model.incrementWeight(exercise),
                          color: Colors.blue,
                          padding: EdgeInsets.zero,
                          height: 45,
                          minWidth: 45,
                          child: Stack(
                            children: [
                              const SizedBox(
                                width: 40,
                                height: 40,
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    '${exercise.weightIncrement}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    vSpaceRegular,
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Reps',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    vSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () => model.decrementReps(),
                          color: Colors.blue,
                          padding: EdgeInsets.zero,
                          height: 45,
                          minWidth: 45,
                          child: const Icon(Icons.remove),
                        ),
                        hSpaceTiny,
                        SizedBox(
                          width: 70,
                          child: TextField(
                            controller: model.repsController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        hSpaceTiny,
                        MaterialButton(
                          onPressed: () => model.incrementReps(),
                          color: Colors.blue,
                          padding: EdgeInsets.zero,
                          height: 45,
                          minWidth: 45,
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                    if (exercise.sets != null) ListView.separated(
                      shrinkWrap: true,
                      itemCount: exercise.sets!.length,
                      itemBuilder: (context, index) {
                        final set = exercise.sets![index];
                        return ListTile(
                          leading: Text(
                            '${set.index}',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('${set.weight} '),
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
                                  Text('${set.reps} '),
                                  Text(
                                    'reps',
                                    style: ktsMediumGreyBodyText.copyWith(
                                      fontSize: 12,
                                    )
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                    ),
                    if (exercise.sets != null) vSpaceRegular,
                    ElevatedButton(
                      onPressed: () => model.addSet(
                        exercise: exercise,
                        workoutId: workout.id,
                      ),
                      child: const Text('Add Set')
                    ),
                  ],
                ),
              )
            );
          },
        ),
      ),
    );
  }
}