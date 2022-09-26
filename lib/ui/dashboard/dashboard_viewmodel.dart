import 'package:flutter/foundation.dart';
import 'package:gymnotes/app/app.locator.dart';
import 'package:gymnotes/app/app.router.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/services/plans_service.dart';
import 'package:gymnotes/services/workouts_service.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends BaseViewModel {
  bool initialized = false;

  WorkoutsService workoutsService = locator<WorkoutsService>();
  NavigationService navigationService = locator<NavigationService>();
  PlansService plansService = locator<PlansService>();

  DateTime selectedDay = DateTime.now();
  List<Workout> workouts = [];

  List<Workout> selectedDayWorkouts = [];

  Future<void> initialise() async {

    workouts = await workoutsService.getWorkouts();
    debugPrint(workouts.toString());
    getSelectedDayWorkouts();
    initialized = true;
    notifyListeners();
  }

  void previousDay() {
    selectedDay = selectedDay.subtract(const Duration(days: 1));
    getSelectedDayWorkouts();
    notifyListeners();
  }

  void nextDay() {
    if (selectedDay.day < DateTime.now().day) {
      selectedDay = selectedDay.add(const Duration(days: 1));
      getSelectedDayWorkouts();
      notifyListeners();
    }
  }

  void getSelectedDayWorkouts() {
    selectedDayWorkouts = workouts.where((workout) => workout.date.day == selectedDay.day).toList();
  }

  String get selectedDayString {
    if (DateTime.now().day - selectedDay.day == 0) {
      return 'Today';
    } else if (DateTime.now().day - selectedDay.day == 1) {
      return 'Yesterday';
    }
    return DateFormat('dd.MM.yyyy').format(selectedDay);
  }

  Future<List<Workout>> getWorkouts() async {
   List<Workout> workouts = await workoutsService.getWorkouts();
   workouts.sort((a, b) => a.date.compareTo(b.date));
   return workouts;
  }

  Future<TPlan> getCurrentPlan() async {
    return await plansService.getCurrentPlan();
  }

  Future<void> startNewWorkout() async {
    await navigationService.navigateTo(
      Routes.createWorkoutView,
      arguments: CreateWorkoutViewArguments(
        plan: await getCurrentPlan(),
        date: selectedDay,
      )
    );
    workouts = await getWorkouts();
    getSelectedDayWorkouts();
    notifyListeners();
  }

  void navigateToPlans() {
    navigationService.navigateTo(Routes.plansView);
  }

  Future<void> navigateToWorkout(Workout workout) async {
    await navigationService.navigateTo(Routes.workoutView, arguments: WorkoutViewArguments(workout: workout));

    workouts = await getWorkouts();
    getSelectedDayWorkouts();
    notifyListeners();
  }
}