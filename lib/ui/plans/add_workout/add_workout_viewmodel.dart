import 'package:gymnotes/app/app.locator.dart';
import 'package:gymnotes/app/app.logger.dart';
import 'package:gymnotes/app/app.router.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'add_workout_view.form.dart';

class AddWorkoutViewModel extends FormViewModel {
  final log = getLogger('AddWorkoutViewModel');

  NavigationService navigationService = locator<NavigationService>();

  List<TExercise> selectedExercises = [];

  Future<void> selectExercises() async {
    List<TExercise> templates = await navigationService.navigateTo(Routes.selectExercisesView);

    for (var template in templates) {
      TExercise exercise = TExercise(
        name: template.name,
        weightIncrement: 2.5,
        index: selectedExercises.length + 1,
        machineSettings: '',
        unit: 'kg',
        defaultNumberOfSets: 3,
      );
      selectedExercises.add(exercise);
    }

    notifyListeners();
  }

  void reorderExercises(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    final TExercise exercise = selectedExercises.removeAt(oldIndex);
    selectedExercises.insert(newIndex, exercise);

    for (var i = 0; i < selectedExercises.length; i++) {
      selectedExercises[i] = selectedExercises[i].copyWith(index: i + 1);
    }

    notifyListeners();
  }

  Future<void> editExercise(TExercise exercise) async {
    TExercise updatedExercise = await navigationService.navigateTo(
      Routes.editExerciseView,
      arguments: EditExerciseViewArguments(exercise: exercise)
    );
    selectedExercises[exercise.index! - 1] = updatedExercise;
    notifyListeners();
  }

  void createWorkoutAndNavigateBack() {
    TWorkout workout = TWorkout(
      name: nameValue!,
      notes: notesValue!,
      exercises: selectedExercises,
    );
    navigationService.back(result: workout);
  }

  void save() {
    log.i('save');
    /// TODO: show error message
    if (nameValue == null || nameValue!.isEmpty || selectedExercises.isEmpty) {
      log.v('nameValue: $nameValue');
      log.v('selectedExercises: $selectedExercises');
      log.e('name or exercises are empty');
      return;
    }

    TWorkout workout = TWorkout(
      name: nameValue!,
      notes: notesValue,
      exercises: selectedExercises,
    );

    navigationService.back(result: workout);
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
}