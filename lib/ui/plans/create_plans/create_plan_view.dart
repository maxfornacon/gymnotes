import 'package:flutter/material.dart';
import 'package:gymnotes/models/application_models.dart';
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
        appBar: AppBar(
          title: const Text('Create a new Plan'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const SizedBox(width: double.infinity,),
              vSpaceRegular,
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              vSpaceRegular,
              const Text(
                'Workouts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              vSpaceRegular,
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
              vSpaceRegular,
              ElevatedButton(
                onPressed: () => model.addWorkout(),
                child: const Text('Add Workout'),
              ),
              vSpaceRegular,
              ElevatedButton(
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

