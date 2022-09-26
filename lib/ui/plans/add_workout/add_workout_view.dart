import 'package:flutter/material.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/ui/dumb_widgets/custom_app_bar.dart';
import 'package:gymnotes/ui/dumb_widgets/responsive_card.dart';
import 'package:gymnotes/ui/dumb_widgets/rounded_button.dart';
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
        appBar: getAppBar('Add Workout', []),
        body: ResponsiveCard(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  hintStyle: TextStyle(
                    color: kcForegroundColor,
                  ),
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
              TextField(
                controller: notesController,
                decoration: const InputDecoration(
                  hintText: 'Notes',
                  hintStyle: TextStyle(
                    color: kcForegroundColor,
                  ),
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
                'Exercises',
                style: TextStyle(
                  fontSize: 20,
                  color: kcForegroundColor,
                ),
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
              RoundedButton(
                onPressed: () => viewModel.selectExercises(),
                child: const Text(
                  'Add Exercise',
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
              vSpaceRegular,
              const Spacer(),
              RoundedButton(
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
