import 'package:gymnotes/api/firestore_api.dart';
import 'package:gymnotes/app/app.locator.dart';
import 'package:gymnotes/app/app.logger.dart';
import 'package:gymnotes/models/application_models.dart';

class WorkoutsService {
  final log = getLogger('WorkoutsService');

  final FirestoreApi _firestoreApi = locator<FirestoreApi>();

  Future<List<Workout>> getWorkouts() async {
    log.i('getWorkouts');
    return await _firestoreApi.getWorkouts();
  }

  Future<Workout> createWorkout({required WorkoutDto workout, List<ExerciseDto>? exercises}) async {
    log.i('workout: $workout');
    String workoutId = await _firestoreApi.createWorkout(workout: workout);

    List<Exercise> exercisesList = [];
    if (exercises != null) {
      for (var exercise in exercises) {
        String exerciseId = await _firestoreApi.createExercise(workoutId: workoutId, exercise: exercise);
        exercisesList.add(
          Exercise(
            id: exerciseId,
            index: exercise.index,
            name: exercise.name,
            weightIncrement: exercise.weightIncrement,
            defaultNumberOfSets: exercise.defaultNumberOfSets,
            machineSettings: exercise.machineSettings,
            unit: exercise.unit,
            sets: null,
          )
        );
      }
    }

    return Workout(
      id: workoutId,
      name: workout.name,
      notes: workout.notes,
      date: workout.date,
      exercises: exercisesList,
    );
  }

  Future<void> deleteWorkout({required String workoutId}) async {
    await _firestoreApi.deleteWorkout(workoutId: workoutId);
  }

  Future<Set> addSetToExercise({
    required String workoutId,
    required String exerciseId,
    required int index,
    required double weight,
    required int reps,
  }) async {
    SetDto setDto = SetDto(
      index: index,
      weight: weight,
      reps: reps,
      isDropset: false,
    );
    return await _firestoreApi.createSet(
        workoutId: workoutId,
        exerciseId: exerciseId,
        setDto: setDto
    );
  }

  Future<void> deleteSetFromExercise({
    required String workoutId,
    required String exerciseId,
    required Set set,
  }) async {
    await _firestoreApi.deleteSet(
      workoutId: workoutId,
      exerciseId: exerciseId,
      setId: set.id,
    );
  }
}