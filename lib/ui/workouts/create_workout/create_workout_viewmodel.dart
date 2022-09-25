import 'package:gymnotes/app/app.locator.dart';
import 'package:gymnotes/app/app.router.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/services/workouts_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'create_workout_view.form.dart';

class CreateWorkoutViewModel extends FormViewModel {

  NavigationService navigationService = locator<NavigationService>();
  WorkoutsService workoutsService = locator<WorkoutsService>();

  List<ExerciseDto> selectedExercises = [];

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

  Future<void> selectExercises() async {
    List<TExercise> templates = await navigationService.navigateTo(Routes.selectExercisesView);

    for (var template in templates) {
      ExerciseDto exercise = ExerciseDto(
        name: template.name,
        notes: '',
        weightIncrement: 2.5,
        index: selectedExercises.length + 1,
      );
      selectedExercises.add(exercise);
    }
    notifyListeners();
  }

  void reorderExercises(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    final ExerciseDto exercise = selectedExercises.removeAt(oldIndex);
    selectedExercises.insert(newIndex, exercise);

    for (var i = 0; i < selectedExercises.length; i++) {
      selectedExercises[i] = selectedExercises[i].copyWith(index: i + 1);
    }

    notifyListeners();
  }

  Future<void> saveWorkout() async {
    WorkoutDto workout = WorkoutDto(
      date: DateTime.now(),
      notes: '',
      name: nameValue!,
    );

    await workoutsService.createWorkout(
      workout: workout,
      exercises: selectedExercises,
    );
    navigationService.back();
  }
}