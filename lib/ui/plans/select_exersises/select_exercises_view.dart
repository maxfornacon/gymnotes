import 'package:flutter/material.dart';
import 'package:gymnotes/ui/dumb_widgets/custom_app_bar.dart';
import 'package:gymnotes/ui/dumb_widgets/responsive_card.dart';
import 'package:gymnotes/ui/dumb_widgets/rounded_box.dart';
import 'package:gymnotes/ui/dumb_widgets/rounded_button.dart';
import 'package:gymnotes/ui/plans/select_exersises/select_exercises_viewmodel.dart';
import 'package:gymnotes/ui/shared/styles.dart';
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
          appBar: getAppBar('Select Exercises', []),
          body: ResponsiveCard(
            child: Column(
              children: [
                model.initialized
                    ? ListView.separated(
                      shrinkWrap: true,
                      itemCount: model.exerciseTemplates.length,
                      separatorBuilder: (context, index) => vSpaceSmall,
                      itemBuilder: (context, index) {
                        bool selected = model.selectedExerciseTemplates.contains(model.exerciseTemplates[index]);
                        return RoundedBox(
                          child: CheckboxListTile(
                            activeColor: kcPrimaryColor,
                            title: Text(
                              model.exerciseTemplates[index].name,
                              style: const TextStyle(
                                color: kcForegroundColor,
                              ),
                            ),
                            value: selected,
                            onChanged: (bool? value) {
                              model.selectExerciseTemplate(model.exerciseTemplates[index]);
                            },
                          ),
                        );
                      },
                    )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
                vSpaceRegular,
                const Spacer(),
                RoundedButton(
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
