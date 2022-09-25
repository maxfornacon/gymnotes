import 'package:gymnotes/app/app.locator.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'edit_exercise_view.form.dart';

class EditExerciseViewModel extends FormViewModel {
  final TExercise exercise;

  EditExerciseViewModel({required this.exercise});

  NavigationService navigationService = locator<NavigationService>();

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

  void save() {
    TExercise updatedExercise = exercise.copyWith(
      name: nameValue == null || nameValue!.isEmpty ? exercise.name : nameValue!,
      weightIncrement: double.parse(
          weightIncrementValue == null || weightIncrementValue!.isEmpty
              ? exercise.weightIncrement.toString()
              : weightIncrementValue!
      ),
      machineSettings: machineSettingsValue,
      defaultNumberOfSets: int.parse(
          defaultNumberOfSetsValue == null || defaultNumberOfSetsValue!.isEmpty
              ? exercise.defaultNumberOfSets.toString()
              : defaultNumberOfSetsValue!
      ),
      unit: unitValue ?? exercise.unit,
    );

    navigationService.back(result: updatedExercise);
  }
}