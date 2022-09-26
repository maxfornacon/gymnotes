import 'package:flutter/material.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/ui/dumb_widgets/custom_app_bar.dart';
import 'package:gymnotes/ui/dumb_widgets/responsive_card.dart';
import 'package:gymnotes/ui/dumb_widgets/rounded_box.dart';
import 'package:gymnotes/ui/dumb_widgets/rounded_button.dart';
import 'package:gymnotes/ui/plans/plans_viewModel.dart';
import 'package:gymnotes/ui/shared/styles.dart';
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
          appBar: getAppBar(
            'Plans',
            [
              IconButton(
                onPressed: () => viewModel.navigateToCreatePlan(),
                icon: const Icon(Icons.add),
              ),
            ],

          ),
          body: ResponsiveCard(
            child: Column(
              children: [
                const SizedBox(width: double.infinity,),
                RoundedButton(
                  onPressed: () => viewModel.navigateToCreatePlan(),
                  child: const Text(
                    'Create new plan',
                  ),
                ),
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
                      vSpaceSmall
                    ],
                  ),
                if (viewModel.currentPlanIsSet) vSpaceRegular,
                viewModel.initialising
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.separated(
                      shrinkWrap: true,
                      itemCount: viewModel.plans.length,
                      separatorBuilder: (context, index) => vSpaceSmall,
                      itemBuilder: (context, index) {
                        TPlan plan = viewModel.plans[index];
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => viewModel.setPlanAsCurrent(plan),
                            child: RoundedBox(
                              border: plan.current ? true : false,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    plan.name,
                                    style: const TextStyle(
                                      color: kcForegroundColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                  vSpaceSmall,
                                  ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: plan.workouts.length,
                                    separatorBuilder: (context, index) => vSpaceSmall,
                                    itemBuilder: (context, index) {
                                      TWorkout workout = plan.workouts[index];
                                      return Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white12,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              workout.name,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: kcForegroundColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            vSpaceTiny,
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
                                                      style: const TextStyle(
                                                        color: kcForegroundColor,
                                                      ),
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