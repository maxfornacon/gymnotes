import 'package:flutter/material.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/ui/plans/add_workout/add_workout_viewmodel.dart';
import 'package:gymnotes/ui/shared/styles.dart';
import 'package:gymnotes/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'add_workout_view.form.dart';

@FormView(
  fields: [
    FormTextField(name: 'name'),
    FormTextField(name: 'notes'),
  ],
)
class AddWorkoutView extends StatelessWidget with $AddWorkoutView {
  AddWorkoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddWorkoutViewModel>.reactive(
      viewModelBuilder: () => AddWorkoutViewModel(),
      onModelReady: (viewModel) => listenToFormUpdated(viewModel),
      onDispose: (viewModel) => disposeForm(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Add Workout'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              vSpaceRegular,
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              vSpaceRegular,
              TextField(
                controller: notesController,
                decoration: const InputDecoration(
                  labelText: 'Notes',
                ),
              ),
              vSpaceRegular,
              Text(
                'Exercises',
                style: Theme.of(context).textTheme.headline6,
              ),
              vSpaceTiny,
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Drag and Drop to reorder exercises according to the order you want to do them in',
                  style: ktsMediumGreyBodyText,
                ),
              ),
              vSpaceRegular,
              ReorderableListView.builder(
                shrinkWrap: true,
                itemCount: viewModel.selectedExercises.length,
                onReorder: (oldIndex, newIndex) {
                  viewModel.reorderExercises(oldIndex, newIndex);
                },
                itemBuilder: (context, index) {
                  TExercise exercise = viewModel.selectedExercises[index];
                  return ListTile(
                    key: ValueKey(exercise),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(exercise.name),
                        vSpaceTiny,
                        Row(
                          children: [
                            Text('Unit: ${exercise.unit ?? 'kg'}', style: ktsMediumGreyBodyText.copyWith(fontSize: 12)),
                            hSpaceSmall,
                            Text('Weight Incr.: ${exercise.weightIncrement!}', style: ktsMediumGreyBodyText.copyWith(fontSize: 12)),
                            hSpaceSmall,
                            Text('Nr. Sets: ${exercise.defaultNumberOfSets!}', style: ktsMediumGreyBodyText.copyWith(fontSize: 12)),
                          ],
                        )
                      ],
                    ),
                    leading: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          exercise.index.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        )
                      )
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: IconButton(
                        icon: const Icon(Icons.edit),
                        splashRadius: 20,
                        onPressed: () => viewModel.editExercise(exercise),
                      ),
                    ),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () => viewModel.selectExercises(),
                child: const Text(
                  'Add Exercise',
                ),
              ),
              vSpaceRegular,
              ElevatedButton(
                onPressed: () => viewModel.save(),
                child: const Text('Add Workout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
