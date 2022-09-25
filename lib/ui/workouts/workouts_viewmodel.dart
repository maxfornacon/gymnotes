import 'package:gymnotes/app/app.locator.dart';
import 'package:gymnotes/app/app.router.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/services/workouts_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WorkoutsViewModel extends BaseViewModel {
  String title = 'Workouts';
  bool initialized = false;

  final NavigationService navigationService = locator<NavigationService>();
  final WorkoutsService workoutsService = locator<WorkoutsService>();

  late List<Workout> workouts;

  initialise() async {
    workouts = await workoutsService.getWorkouts();
    initialized = true;
    notifyListeners();
  }

  Future<List<Workout>> getWorkouts() {
    return workoutsService.getWorkouts();
  }


  Future<void> navigateToCreateWorkout() async {
    await navigationService.navigateTo(Routes.createWorkoutView);
    notifyListeners();
  }

  void goBack() {
    navigationService.back();
  }
}