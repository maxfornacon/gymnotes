import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/ui/dashboard/dashboard_viewmodel.dart';
import 'package:gymnotes/ui/dumb_widgets/responsive_card.dart';
import 'package:gymnotes/ui/dumb_widgets/rounded_box.dart';
import 'package:gymnotes/ui/dumb_widgets/rounded_button.dart';
import 'package:gymnotes/ui/shared/responsive.dart';
import 'package:gymnotes/ui/shared/styles.dart';
import 'package:gymnotes/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      onModelReady: (model) async => await model.initialise(),
      builder: (context, viewModel, child) {
        return Scaffold(
          // appBar: AppBar(
          //   title: const Text('Dashboard'),
          //   actions: [
          //     IconButton(
          //       onPressed: () => viewModel.navigateToPlans(),
          //       icon: const Icon(Icons.list_alt_rounded),
          //       tooltip: 'Workout plans overview',
          //     ),
          //   ],
          // ),
          body: ResponsiveCard(
            child: Column(
              children: [
                const SizedBox(width: double.infinity,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => viewModel.previousDay(),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: kcForegroundColor,
                      )
                    ),
                    Text(
                      viewModel.selectedDayString,
                      style: const TextStyle(
                        color: kcForegroundColor,
                      )
                    ),
                    IconButton(
                      onPressed: () => viewModel.nextDay(),
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: kcForegroundColor,
                      )
                    ),
                  ],
                ),
                vSpaceRegular,
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewModel.selectedDayWorkouts.length,
                  itemBuilder: (context, index) {
                    Workout workout = viewModel.selectedDayWorkouts[index];
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => viewModel.navigateToWorkout(workout),
                        child: RoundedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  workout.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: kcForegroundColor,
                                  ),
                                ),
                              ),
                              const Divider(
                                color: kcForegroundColor,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: workout.exercises.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    workout.exercises[index].name,
                                    style: const TextStyle(
                                      color: kcForegroundColor,
                                    ),
                                  );
                                }
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                ),
                vSpaceRegular,
                const Spacer(),
                RoundedBox(
                  child: HeatMap(
                    datasets: viewModel.heatMapData,
                    colorMode: ColorMode.color,
                    textColor: kcForegroundColor,
                    defaultColor: kcForegroundColor.withOpacity(0.2),
                    showText: false,
                    showColorTip: false,
                    scrollable: true,
                    colorsets: const {
                      1: kcPrimaryColor,
                    },
                  )
                ),
                vSpaceRegular,
                RoundedButton(
                  'Start a new Workout',
                  onPressed: () => viewModel.startNewWorkout(),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
