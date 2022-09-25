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

  Future<void> createWorkout({required WorkoutDto workout, List<ExerciseDto>? exercises}) async {
    log.i('workout: $workout');
    String workoutId = await _firestoreApi.createWorkout(workout: workout);

    if (exercises != null) {
      for (var exercise in exercises) {
        await _firestoreApi.createExercise(workoutId: workoutId, exercise: exercise);
      }
    }
  }
}