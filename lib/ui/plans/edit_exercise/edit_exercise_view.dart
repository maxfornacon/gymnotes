import 'package:flutter/material.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/ui/dumb_widgets/custom_app_bar.dart';
import 'package:gymnotes/ui/dumb_widgets/responsive_card.dart';
import 'package:gymnotes/ui/dumb_widgets/rounded_button.dart';
import 'package:gymnotes/ui/shared/styles.dart';
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
        return Scaffold(
          appBar: getAppBar('Edit Exercise', []),
          body: ResponsiveCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Edit your presets for this Exercise',
                  style: TextStyle(
                    color: kcMediumGreyColor,
                  ),
                ),
                vSpaceRegular,
                const Text(
                  'Name',
                  style: TextStyle(
                    color: kcForegroundColor,
                  ),
                ),
                vSpaceTiny,
                TextFormField(
                  initialValue: exercise.name,
                  onChanged: (value) {
                    nameController.text = value.trim();
                  },
                  decoration: const InputDecoration(
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

                ),
                vSpaceRegular,
                const Text(
                  'Weight Increment',
                  style: TextStyle(
                    color: kcForegroundColor
                  ),
                ),
                vSpaceTiny,
                TextFormField(
                  initialValue: exercise.weightIncrement.toString(),
                  onChanged: (value) {
                    weightIncrementController.text = value.trim();
                  },
                  keyboardType: TextInputType.number,

                  decoration: const InputDecoration(
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
                ),
                vSpaceRegular,
                DropdownButtonFormField(
                  decoration: const InputDecoration(
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
                    color: kcForegroundColor,
                  ),
                  dropdownColor: const Color(0xFF323137),
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
                const Text(
                  'Machine Settings',
                  style: TextStyle(
                    color: kcForegroundColor,
                  ),
                ),
                vSpaceTiny,
                TextFormField(
                  initialValue: exercise.machineSettings,
                  onChanged: (value) {
                    machineSettingsController.text = value.trim();
                  },
                  maxLines: 3,
                  decoration: const InputDecoration(
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

                ),
                vSpaceRegular,
                const Text(
                  'Default Number of Sets',
                  style: TextStyle(
                    color: kcForegroundColor
                  ),
                ),
                vSpaceTiny,
                TextFormField(
                  initialValue: exercise.defaultNumberOfSets.toString(),
                  onChanged: (value) {
                    defaultNumberOfSetsController.text = value.trim();
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
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
                ),
                vSpaceRegular,
                RoundedButton(
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
