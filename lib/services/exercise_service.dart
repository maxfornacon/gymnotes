import 'package:gymnotes/api/firestore_api.dart';
import 'package:gymnotes/app/app.locator.dart';
import 'package:gymnotes/app/app.logger.dart';
import 'package:gymnotes/models/application_models.dart';

class ExerciseService {
  final log = getLogger('ExerciseService');

  final FirestoreApi _firestoreApi = locator<FirestoreApi>();

  Future<List<TExercise>> getExerciseTemplates() async {
    log.i('getExercises');
    return await _firestoreApi.getExerciseTemplates();
  }
}