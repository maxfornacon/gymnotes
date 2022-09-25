import 'package:flutter/material.dart';
import 'package:gymnotes/ui/shared/ui_helpers.dart';
import 'package:gymnotes/ui/workouts/workouts_viewmodel.dart';
import 'package:stacked/stacked.dart';

class WorkoutsView extends StatelessWidget {
  const WorkoutsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WorkoutsViewModel>.reactive(
      viewModelBuilder: () => WorkoutsViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              IconButton(onPressed: () => model.goBack(), icon: const Icon(Icons.arrow_back_ios)),
              Text(
                model.title,
                style: const TextStyle(
                  fontSize: 34
                )
              ),
              vSpaceRegular,
              model.initialized ? ListView.builder(
                shrinkWrap: true,
                itemCount: model.workouts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(model.workouts[index].name),
                  );
                },
              ) : const Center(
                child: CircularProgressIndicator(),
              ),
              ElevatedButton(
                onPressed: () => model.navigateToCreateWorkout(),
                child: const Text('Create Workout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
