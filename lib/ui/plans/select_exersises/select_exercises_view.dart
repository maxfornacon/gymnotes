import 'package:flutter/material.dart';
import 'package:gymnotes/ui/plans/select_exersises/select_exercises_viewmodel.dart';
import 'package:gymnotes/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class SelectExercisesView extends StatelessWidget {
  const SelectExercisesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectExercisesViewModel>.reactive(
      viewModelBuilder: () => SelectExercisesViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: ((context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Select Exercises'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                vSpaceRegular,
                model.initialized
                    ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: model.exerciseTemplates.length,
                      itemBuilder: (context, index) {
                        bool selected = model.selectedExerciseTemplates.contains(model.exerciseTemplates[index]);
                        return CheckboxListTile(
                          title: Text(model.exerciseTemplates[index].name),
                          value: selected,
                          onChanged: (bool? value) {
                            model.selectExerciseTemplate(model.exerciseTemplates[index]);
                          },
                        );
                      },
                    )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
                ElevatedButton(
                  onPressed: () => model.selectExercisesAndGoBack(),
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
