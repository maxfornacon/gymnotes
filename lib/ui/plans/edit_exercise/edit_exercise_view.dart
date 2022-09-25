import 'package:flutter/material.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'edit_exercise_viewmodel.dart';
import 'edit_exercise_view.form.dart';

@FormView(
  fields: [
    FormTextField(name: 'name'),
    FormTextField(name: 'weightIncrement'),
    FormTextField(name: 'machineSettings'),
    FormTextField(name: 'defaultNumberOfSets'),
    FormDropdownField(
      name: 'unit',
      items: [
        StaticDropdownItem(
          title: 'Kilogram',
          value: 'kg',
        ),
        StaticDropdownItem(
          title: 'Pounds',
          value: 'lbs',
        ),
      ],
    )
  ],
)
class EditExerciseView extends StatelessWidget with $EditExerciseView {
  final TExercise exercise;

  EditExerciseView({
    Key? key,
    required this.exercise,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditExerciseViewModel>.reactive(
      viewModelBuilder: () => EditExerciseViewModel(exercise: exercise),
      onModelReady: (viewModel) => listenToFormUpdated(viewModel),
      onDispose: (_) => disposeForm(),
      builder: ((context, viewModel, child) {
        // nameController.text = exercise.name;
        // weightIncrementController.text = exercise.weightIncrement.toString();
        // machineSettingsController.text = exercise.machineSettings ?? '';
        // defaultNumberOfSetsController.text =
        //     exercise.defaultNumberOfSets.toString();
        // viewModel.setUnit(exercise.unit ?? 'kg');

        return Scaffold(
          appBar: AppBar(
            title: const Text('Edit Exercise'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                vSpaceRegular,
                const Text('Edit your presets for this Exercise'),
                vSpaceRegular,
                TextFormField(
                  initialValue: exercise.name,
                  onChanged: (value) {
                    nameController.text = value.trim();
                  },
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                vSpaceRegular,
                TextFormField(
                  initialValue: exercise.weightIncrement.toString(),
                  onChanged: (value) {
                    weightIncrementController.text = value.trim();
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Weight Increment',
                  ),
                ),
                vSpaceRegular,
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    labelText: 'Unit',
                  ),
                  value: viewModel.unitValue,
                  items: const [
                    DropdownMenuItem(
                      value: 'kg',
                      child: Text('Kilogram'),
                    ),
                    DropdownMenuItem(
                      value: 'lbs',
                      child: Text('Pounds'),
                    ),
                  ],
                  onChanged: (String? value) => viewModel.setUnit(value!),
                ),
                vSpaceRegular,
                TextFormField(
                  initialValue: exercise.machineSettings,
                  onChanged: (value) {
                    machineSettingsController.text = value.trim();
                  },
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Machine Settings',
                  ),
                ),
                vSpaceRegular,
                TextFormField(
                  initialValue: exercise.defaultNumberOfSets.toString(),
                  onChanged: (value) {
                    defaultNumberOfSetsController.text = value.trim();
                  },
                  decoration: const InputDecoration(
                    labelText: 'Default Number of Sets',
                  ),
                ),
                vSpaceRegular,
                ElevatedButton(
                  onPressed: () => viewModel.save(),
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
