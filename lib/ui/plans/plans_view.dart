import 'package:flutter/material.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/ui/plans/plans_viewModel.dart';
import 'package:gymnotes/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class PlansView extends StatelessWidget {
  const PlansView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlansViewModel>.reactive(
      viewModelBuilder: () => PlansViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Plans'),
            actions: [
              IconButton(
                onPressed: () => viewModel.navigateToCreatePlan(),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const SizedBox(width: double.infinity,),
                if (!viewModel.currentPlanIsSet)
                  Column(
                    children: const [
                      vSpaceRegular,
                      Text(
                        'No current plan set! Please set a current plan to start tracking your workouts.',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                vSpaceRegular,
                viewModel.initialising
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                      shrinkWrap: true,
                      itemCount: viewModel.plans.length,
                      itemBuilder: (context, index) {
                        TPlan plan = viewModel.plans[index];
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => viewModel.setPlanAsCurrent(plan),
                            child: Card(
                              color: plan.current ? Colors.blue.shade200 : Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      plan.name,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    vSpaceRegular,
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: plan.workouts.length,
                                      itemBuilder: (context, index) {
                                        TWorkout workout = plan.workouts[index];
                                        return Container(
                                          padding: const EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black12,
                                              width: 2
                                            ),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                workout.name,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              vSpaceRegular,
                                              ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: workout.exercises.length,
                                                itemBuilder: (context, index) {
                                                  TExercise exercise = workout.exercises[index];
                                                  return Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        exercise.name,

                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
              ],
            ),
          ),
        );
      }
    );
  }
}