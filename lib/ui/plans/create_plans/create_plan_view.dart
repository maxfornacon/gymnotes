import 'package:flutter/material.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/ui/dumb_widgets/custom_app_bar.dart';
import 'package:gymnotes/ui/dumb_widgets/responsive_card.dart';
import 'package:gymnotes/ui/dumb_widgets/rounded_button.dart';
import 'package:gymnotes/ui/shared/styles.dart';
import 'package:gymnotes/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'create_plan_viewmodel.dart';

import 'create_plan_view.form.dart';

@FormView(
  fields: [
    FormTextField(name: 'name'),
  ],
)
class CreatePlanView extends StatelessWidget with $CreatePlanView {
  CreatePlanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreatePlanViewModel>.reactive(
      viewModelBuilder: () => CreatePlanViewModel(),
      onModelReady: (viewModel) => listenToFormUpdated(viewModel),
      onDispose: (viewModel) => disposeForm(),
      builder: (context, model, child) => Scaffold(
        appBar: getAppBar('Create a new Plan', []),
        body: ResponsiveCard(
          child: Column(
            children: [
              const SizedBox(width: double.infinity,),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Plan name',
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
                'Workouts',
                style: TextStyle(
                  fontSize: 20,
                  color: kcForegroundColor,
                ),
              ),
              vSpaceRegular,
              RoundedButton(
                onPressed: () => model.addWorkout(),
                child: const Text('Add Workout'),
              ),
              vSpaceRegular,
              if (model.workouts.isEmpty)
                const Text(
                  'No workouts added yet',
                  style: TextStyle(
                    color: kcForegroundColor,
                  ),
                ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: model.workouts.length,
                itemBuilder: (context, index) {
                  TWorkout workout = model.workouts[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            workout.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: workout.exercises.length,
                            itemBuilder: (context, index) {
                              TExercise exercise = workout.exercises[index];
                              return Text(exercise.name);
                            },
                          )
                        ],
                      ),
                    ),
                  );
                }
              ),
              const Spacer(),
              vSpaceRegular,
              RoundedButton(
                onPressed: () => model.createPlan(),
                child: model.isBusy
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Create Plan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

