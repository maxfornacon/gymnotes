import 'package:flutter/material.dart';
import 'package:gymnotes/app/app.locator.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/services/workouts_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WorkoutViewModel extends BaseViewModel {
  bool initialising = true;
  final Workout workout;
  List<Exercise> exercises = [];

  final pageController = PageController();
  final weightController = TextEditingController();
  final repsController = TextEditingController();

  WorkoutsService workoutsService = locator<WorkoutsService>();
  DialogService dialogService = locator<DialogService>();
  NavigationService navigationService = locator<NavigationService>();

  WorkoutViewModel({
    required this.workout
  });
  // Add your state and logic here

  void init() {
    exercises = workout.exercises;
    weightController.text = '0';
    repsController.text = '0';

    initialising = false;
    notifyListeners();
  }

  Future<void> addSet({required Exercise exercise, required String workoutId}) async {

    int index = exercise.sets == null ? 1 : exercise.sets!.length + 1;

    Set set = await workoutsService.addSetToExercise(
      workoutId: workoutId,
      exerciseId: exercise.id,
      index: index,
      weight: double.parse(weightController.text),
      reps: int.parse(repsController.text),
    );

    late Exercise updatedExercise;
    if (exercise.sets == null) {
      updatedExercise = exercise.copyWith(sets: [set]);
    } else {
      updatedExercise = exercise.copyWith(sets: exercise.sets!.toList()..add(set));
    }

    exercises = exercises.map((e) {
      if (e.id == exercise.id) {
        return updatedExercise;
      }
      return e;
    }).toList();

    notifyListeners();
  }

  void deleteSet({required Exercise exercise, required Set set}) {
    workoutsService.deleteSetFromExercise(
      workoutId: workout.id,
      exerciseId: exercise.id,
      set: set,
    );

    exercises = exercises.map((e) {
      if (e.id == exercise.id) {
        return e.copyWith(sets: e.sets!.where((s) => s.id != set.id).toList());
      }
      return e;
    }).toList();

    notifyListeners();
  }

  void decrementWeight(Exercise exercise) {
    double weight = double.parse(weightController.text);
    if (weight - exercise.weightIncrement >= 0) {
      weight = weight - exercise.weightIncrement;
    }
    weightController.text = weight.toString();
  }

  void incrementWeight(Exercise exercise) {
    double weight = double.parse(weightController.text);
    weight = weight + exercise.weightIncrement;
    weightController.text = weight.toString();
  }

  void decrementReps() {
    int reps = int.parse(repsController.text);
    if (reps - 1 >= 0) {
      reps = reps - 1;
    }
    repsController.text = reps.toString();
  }

  void incrementReps() {
    int reps = int.parse(repsController.text);
    reps = reps + 1;
    repsController.text = reps.toString();
  }

  void previousPage() {
    weightController.text = '0';
    repsController.text = '0';
    pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
  void nextPage() {
    weightController.text = '0';
    repsController.text = '0';
    pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }


  void deleteWorkout() async {
    DialogResponse? response = await dialogService.showDialog(
      title: 'Delete Workout',
      description: 'Are you sure you want to delete this workout?',
      buttonTitle: 'Delete',
      cancelTitle: 'Cancel',
      dialogPlatform: DialogPlatform.Material,
    );

    if (response!.confirmed) {
      await workoutsService.deleteWorkout(workoutId: workout.id);
      navigationService.back();
    }

    // await workoutsService.deleteWorkout(workoutId: workout.id);
  }
}