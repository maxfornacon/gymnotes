import 'package:flutter/material.dart';
import 'package:gymnotes/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'create_workout_view.form.dart';
import 'create_workout_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(name: 'name'),
  ],
)
class CreateWorkoutView extends StatelessWidget with $CreateWorkoutView {
  CreateWorkoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateWorkoutViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      viewModelBuilder: () => CreateWorkoutViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                vSpaceLarge,
                const Text(
                  'Create a new Workout',
                  style: TextStyle(
                    fontSize: 34
                  )
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                vSpaceRegular,
                const Text('Exercises'),
                vSpaceRegular,
                ElevatedButton(
                  onPressed: () => viewModel.selectExercises(),
                  child: const Text('Add Exercise'),
                ),
                vSpaceRegular,
                ReorderableListView.builder(
                  shrinkWrap: true,
                  itemCount: viewModel.selectedExercises.length,
                  onReorder: (oldIndex, newIndex) {
                    viewModel.reorderExercises(oldIndex, newIndex);
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      key: ValueKey(viewModel.selectedExercises[index]),
                      title: Text(viewModel.selectedExercises[index].name),
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
                            viewModel.selectedExercises[index].index.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          )
                        )
                      ),
                    );
                  },
                ),
                vSpaceRegular,
                ElevatedButton(
                  // onPressed: viewModel.saveData,
                  onPressed: () async {
                    await viewModel.saveWorkout();
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
