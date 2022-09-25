import 'package:flutter/foundation.dart';
import 'package:gymnotes/app/app.locator.dart';
import 'package:gymnotes/app/app.logger.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/services/exercise_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SelectExercisesViewModel extends BaseViewModel {
  final log = getLogger('SelectExercisesViewModel');

  String title = 'Select Exercises';
  bool initialized = false;

  List<TExercise> exerciseTemplates = [];
  List<TExercise> selectedExerciseTemplates = [];

  ExerciseService exerciseService = locator<ExerciseService>();
  NavigationService navigationService = locator<NavigationService>();

  void initialise() async {
    exerciseTemplates = await exerciseService.getExerciseTemplates();
    initialized = true;
    notifyListeners();
  }

  Future<List<TExercise>> getExerciseTemplates() async {
    return await exerciseService.getExerciseTemplates();
  }

  void selectExerciseTemplate(TExercise exerciseTemplate) {
    if (selectedExerciseTemplates.contains(exerciseTemplate)) {
      selectedExerciseTemplates.remove(exerciseTemplate);
      log.v('Unselected exerciseTemplate: ${exerciseTemplate.name}');
    } else {
      selectedExerciseTemplates.add(exerciseTemplate);
      log.v('Selected exerciseTemplate: ${exerciseTemplate.name}');
    }
    notifyListeners();
  }

  void selectExercisesAndGoBack() {
    log.i('selectExercisesAndGoBack');
    navigationService.back(result: selectedExerciseTemplates);
  }
}