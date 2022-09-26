import 'package:flutter/material.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/ui/dumb_widgets/custom_app_bar.dart';
import 'package:gymnotes/ui/dumb_widgets/responsive_card.dart';
import 'package:gymnotes/ui/dumb_widgets/rounded_box.dart';
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
                  'Drag and Drop to reorder exercises according to the order you want to do them in.',
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

              Theme(
                data: ThemeData(
                  canvasColor: Colors.transparent,
                ),
                child: ReorderableListView.builder(
                  shrinkWrap: true,
                  itemCount: viewModel.selectedExercises.length,
                  onReorder: (oldIndex, newIndex) {
                    viewModel.reorderExercises(oldIndex, newIndex);
                  },
                  buildDefaultDragHandles: false,
                  itemBuilder: (context, index) {
                    TExercise exercise = viewModel.selectedExercises[index];
                    return Container(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      key: ValueKey(exercise),
                      child: RoundedBox(
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                exercise.name,
                                style: const TextStyle(
                                  color: kcForegroundColor,
                                ),
                              ),
                              vSpaceTiny,
                              Wrap(
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
                                color: kcForegroundColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Center(
                              child: Text(
                                exercise.index.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: kcForegroundColor,
                                ),
                              )
                            )
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: ButtonBar(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: kcForegroundColor,
                                  ),
                                  splashRadius: 20,
                                  onPressed: () => viewModel.editExercise(exercise),
                                ),
                                ReorderableDragStartListener(
                                  index: index,
                                  child: const Icon(
                                    Icons.drag_handle,
                                    color: kcForegroundColor,
                                  )
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
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
