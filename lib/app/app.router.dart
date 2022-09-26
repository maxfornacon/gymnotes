// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/foundation.dart' as _i12;
import 'package:flutter/material.dart';
import 'package:gymnotes/models/application_models.dart' as _i13;
import 'package:gymnotes/ui/create_account/create_account_view.dart' as _i4;
import 'package:gymnotes/ui/dashboard/dashboard_view.dart' as _i6;
import 'package:gymnotes/ui/login/login_view.dart' as _i2;
import 'package:gymnotes/ui/plans/add_workout/add_workout_view.dart' as _i9;
import 'package:gymnotes/ui/plans/create_plans/create_plan_view.dart' as _i8;
import 'package:gymnotes/ui/plans/edit_exercise/edit_exercise_view.dart'
    as _i10;
import 'package:gymnotes/ui/plans/plans_view.dart' as _i7;
import 'package:gymnotes/ui/plans/select_exersises/select_exercises_view.dart'
    as _i5;
import 'package:gymnotes/ui/workouts/create_workout/create_workout_view.dart'
    as _i3;
import 'package:gymnotes/ui/workouts/workout/workout_view.dart' as _i11;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i14;

class Routes {
  static const loginView = '/';

  static const createWorkoutView = '/create-workout-view';

  static const createAccountView = '/create-account-view';

  static const selectExercisesView = '/select-exercises-view';

  static const dashboardView = '/dashboard-view';

  static const plansView = '/plans-view';

  static const createPlanView = '/create-plan-view';

  static const addWorkoutView = '/add-workout-view';

  static const editExerciseView = '/edit-exercise-view';

  static const workoutView = '/workout-view';

  static const all = <String>{
    loginView,
    createWorkoutView,
    createAccountView,
    selectExercisesView,
    dashboardView,
    plansView,
    createPlanView,
    addWorkoutView,
    editExerciseView,
    workoutView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.loginView,
      page: _i2.LoginView,
    ),
    _i1.RouteDef(
      Routes.createWorkoutView,
      page: _i3.CreateWorkoutView,
    ),
    _i1.RouteDef(
      Routes.createAccountView,
      page: _i4.CreateAccountView,
    ),
    _i1.RouteDef(
      Routes.selectExercisesView,
      page: _i5.SelectExercisesView,
    ),
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i6.DashboardView,
    ),
    _i1.RouteDef(
      Routes.plansView,
      page: _i7.PlansView,
    ),
    _i1.RouteDef(
      Routes.createPlanView,
      page: _i8.CreatePlanView,
    ),
    _i1.RouteDef(
      Routes.addWorkoutView,
      page: _i9.AddWorkoutView,
    ),
    _i1.RouteDef(
      Routes.editExerciseView,
      page: _i10.EditExerciseView,
    ),
    _i1.RouteDef(
      Routes.workoutView,
      page: _i11.WorkoutView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(
        orElse: () => const LoginViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i2.LoginView(key: args.key),
        settings: data,
      );
    },
    _i3.CreateWorkoutView: (data) {
      final args = data.getArgs<CreateWorkoutViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i3.CreateWorkoutView(
            key: args.key, plan: args.plan, date: args.date),
        settings: data,
      );
    },
    _i4.CreateAccountView: (data) {
      final args = data.getArgs<CreateAccountViewArguments>(
        orElse: () => const CreateAccountViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i4.CreateAccountView(key: args.key),
        settings: data,
      );
    },
    _i5.SelectExercisesView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.SelectExercisesView(),
        settings: data,
      );
    },
    _i6.DashboardView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.DashboardView(),
        settings: data,
      );
    },
    _i7.PlansView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.PlansView(),
        settings: data,
      );
    },
    _i8.CreatePlanView: (data) {
      final args = data.getArgs<CreatePlanViewArguments>(
        orElse: () => const CreatePlanViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i8.CreatePlanView(key: args.key),
        settings: data,
      );
    },
    _i9.AddWorkoutView: (data) {
      final args = data.getArgs<AddWorkoutViewArguments>(
        orElse: () => const AddWorkoutViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i9.AddWorkoutView(key: args.key),
        settings: data,
      );
    },
    _i10.EditExerciseView: (data) {
      final args = data.getArgs<EditExerciseViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i10.EditExerciseView(key: args.key, exercise: args.exercise),
        settings: data,
      );
    },
    _i11.WorkoutView: (data) {
      final args = data.getArgs<WorkoutViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i11.WorkoutView(key: args.key, workout: args.workout),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class LoginViewArguments {
  const LoginViewArguments({this.key});

  final _i12.Key? key;
}

class CreateWorkoutViewArguments {
  const CreateWorkoutViewArguments({
    this.key,
    required this.plan,
    required this.date,
  });

  final _i12.Key? key;

  final _i13.TPlan plan;

  final DateTime date;
}

class CreateAccountViewArguments {
  const CreateAccountViewArguments({this.key});

  final _i12.Key? key;
}

class CreatePlanViewArguments {
  const CreatePlanViewArguments({this.key});

  final _i12.Key? key;
}

class AddWorkoutViewArguments {
  const AddWorkoutViewArguments({this.key});

  final _i12.Key? key;
}

class EditExerciseViewArguments {
  const EditExerciseViewArguments({
    this.key,
    required this.exercise,
  });

  final _i12.Key? key;

  final _i13.TExercise exercise;
}

class WorkoutViewArguments {
  const WorkoutViewArguments({
    this.key,
    required this.workout,
  });

  final _i12.Key? key;

  final _i13.Workout workout;
}

extension NavigatorStateExtension on _i14.NavigationService {
  Future<dynamic> navigateToLoginView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateWorkoutView({
    _i12.Key? key,
    required _i13.TPlan plan,
    required DateTime date,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createWorkoutView,
        arguments: CreateWorkoutViewArguments(key: key, plan: plan, date: date),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateAccountView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createAccountView,
        arguments: CreateAccountViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSelectExercisesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.selectExercisesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPlansView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.plansView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreatePlanView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createPlanView,
        arguments: CreatePlanViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddWorkoutView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addWorkoutView,
        arguments: AddWorkoutViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditExerciseView({
    _i12.Key? key,
    required _i13.TExercise exercise,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.editExerciseView,
        arguments: EditExerciseViewArguments(key: key, exercise: exercise),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWorkoutView({
    _i12.Key? key,
    required _i13.Workout workout,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.workoutView,
        arguments: WorkoutViewArguments(key: key, workout: workout),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
