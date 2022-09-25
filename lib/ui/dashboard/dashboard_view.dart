import 'package:flutter/material.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/ui/dashboard/dashboard_viewmodel.dart';
import 'package:gymnotes/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      onModelReady: (model) async => await model.initialise(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Dashboard'),
            actions: [
              IconButton(
                onPressed: () => model.navigateToPlans(),
                icon: const Icon(Icons.list_alt_rounded),
                tooltip: 'Workout plans overview',
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const SizedBox(width: double.infinity,),

                vSpaceRegular,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => model.previousDay(),
                      icon: const Icon(Icons.arrow_back_ios)
                    ),
                    Text(
                      model.selectedDayString
                    ),
                    IconButton(
                      onPressed: () => model.nextDay(),
                      icon: const Icon(Icons.arrow_forward_ios)
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: model.selectedDayWorkouts.length,
                  itemBuilder: (context, index) {
                    Workout workout = model.selectedDayWorkouts[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              workout.name,
                              style: const TextStyle(
                                fontSize: 20
                              ),
                            ),
                            const Divider(),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: workout.exercises.length,
                              itemBuilder: (context, index) {
                                return Text(workout.exercises[index].name);
                              }
                            )
                          ],
                        ),
                      ),
                    );
                  }
                ),
                vSpaceRegular,
                ElevatedButton(
                  onPressed: () => model.navigateToWorkouts(),
                  child: const Text('Start a new Workout')
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
