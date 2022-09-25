import 'package:gymnotes/api/firestore_api.dart';
import 'package:gymnotes/services/exercise_service.dart';
import 'package:gymnotes/services/plans_service.dart';
import 'package:gymnotes/services/user_service.dart';
import 'package:gymnotes/services/workouts_service.dart';
import 'package:gymnotes/ui/create_account/create_account_view.dart';
import 'package:gymnotes/ui/dashboard/dashboard_view.dart';
import 'package:gymnotes/ui/login/login_view.dart';
import 'package:gymnotes/ui/plans/add_workout/add_workout_view.dart';
import 'package:gymnotes/ui/plans/create_plans/create_plan_view.dart';
import 'package:gymnotes/ui/plans/edit_exercise/edit_exercise_view.dart';
import 'package:gymnotes/ui/plans/plans_view.dart';
import 'package:gymnotes/ui/plans/select_exersises/select_exercises_view.dart';
import 'package:gymnotes/ui/workouts/create_workout/create_workout_view.dart';
import 'package:gymnotes/ui/workouts/workouts_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/startup/startup_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: LoginView, initial: true),
    MaterialRoute(page: WorkoutsView),
    MaterialRoute(page: CreateWorkoutView),
    MaterialRoute(page: CreateAccountView),
    MaterialRoute(page: SelectExercisesView),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: PlansView),
    MaterialRoute(page: CreatePlanView),
    MaterialRoute(page: AddWorkoutView),
    MaterialRoute(page: EditExerciseView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: FirestoreApi),
    Singleton(classType: FirebaseAuthenticationService),
    Singleton(classType: ExerciseService),
    Singleton(classType: WorkoutsService),
    Singleton(classType: PlansService),
  ],
  logger: StackedLogger(),
)
class AppSetup {

}