import 'package:gymnotes/app/app.locator.dart';
import 'package:gymnotes/app/app.router.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/services/workouts_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


class CreateWorkoutViewModel extends BaseViewModel {

  final TPlan plan;

  CreateWorkoutViewModel({required this.plan});

  NavigationService navigationService = locator<NavigationService>();
  WorkoutsService workoutsService = locator<WorkoutsService>();

  Future<void> selectWorkout(TWorkout tWorkout, DateTime date) async {
    WorkoutDto workoutDto = WorkoutDto(
      name: tWorkout.name,
      notes: tWorkout.notes ?? '',
      date: date,
    );

    List<ExerciseDto> exerciseDtos = [];
    for (TExercise tExercise in tWorkout.exercises) {
      ExerciseDto exerciseDto = ExerciseDto(
        name: tExercise.name,
        index: tExercise.index!,
        weightIncrement: tExercise.weightIncrement!,
        defaultNumberOfSets: tExercise.defaultNumberOfSets!,
        machineSettings: tExercise.machineSettings!,
        unit: tExercise.unit!,
      );
      exerciseDtos.add(exerciseDto);
    }

    Workout workout = await workoutsService.createWorkout(workout: workoutDto, exercises: exerciseDtos);
    navigationService.replaceWith(Routes.workoutView, arguments: WorkoutViewArguments(workout: workout));
  }

}