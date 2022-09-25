import 'package:flutter/foundation.dart';
import 'package:gymnotes/app/app.locator.dart';
import 'package:gymnotes/app/app.logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gymnotes/exceptions/firestore_api_exception.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/services/user_service.dart';

class FirestoreApi {
  final log = getLogger('FirestoreApi');

  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  final CollectionReference exerciseTemplatesCollection = FirebaseFirestore.instance.collection('exercise_templates');

  Future<void> createUser({required User user}) async {
    log.i('user: $user');

    try {
      final userDocument = usersCollection.doc(user.id);
      await userDocument.set(user.toJson());
      log.v('user created at ${userDocument.path}');
    } catch (e) {
      throw FirestoreApiException(
        message: 'Failed to create new user',
        devDetails: e.toString(),
      );
    }
  }

  Future<User?> getUser({required String userId}) async {
    log.i('userId: $userId');

    if (userId.isNotEmpty) {
      final userDocument = await usersCollection.doc(userId).get();
      if (!userDocument.exists) {
        log.v('We have no user with id $userId in our database');
        return null;
      }

      final userData = userDocument.data() as Map<String, dynamic>;
      log.v('User found. Data: $userData');
      return User.fromJson(userData);
    } else {
      throw FirestoreApiException(
        message: 'Failed to get user. User id is empty',
      );
    }
  }

  /// Returns a list of all exercise templates
  Future<List<TExercise>> getExerciseTemplates() async {
    QuerySnapshot exerciseTemplatesSnapshot = await exerciseTemplatesCollection.get();
    List<TExercise> exerciseTemplates = [];

    if (exerciseTemplatesSnapshot.docs.isNotEmpty) {
      log.v('Found ${exerciseTemplatesSnapshot.docs.length} ExerciseTemplates');
    }

    for (DocumentSnapshot exerciseTemplateSnapshot in exerciseTemplatesSnapshot.docs) {
      debugPrint('exerciseTemplateSnapshot: ${exerciseTemplateSnapshot.data()}');
      exerciseTemplates.add(TExercise.fromJson(exerciseTemplateSnapshot.data() as Map<String, dynamic>));
    }
    return exerciseTemplates;
  }

  Future<List<Workout>> getWorkouts() async {
    User currentUser = locator<UserService>().currentUser;

    try {
      QuerySnapshot workoutsQuerySnapshot = await usersCollection
          .doc(currentUser.id)
          .collection('workouts')
          .get();

      List<Workout> workouts = [];
      for (DocumentSnapshot workoutSnapshot in workoutsQuerySnapshot.docs) {
        List<Exercise> exercises = await getExercises(workoutId: workoutSnapshot.id);
        workouts.add(
          Workout.fromDocument(workoutSnapshot as DocumentSnapshot<Map<String, dynamic>>, exercises)
        );
      }

      return workouts;
    } catch (e) {
      throw FirestoreApiException(
        message: 'Failed to get workouts',
        devDetails: e.toString(),
      );
    }
  }

  getExercises({required String workoutId}) async {
    log.i('workoutId: $workoutId');

    User currentUser = locator<UserService>().currentUser;

    try {
      QuerySnapshot exercisesQuerySnapshot = await usersCollection
          .doc(currentUser.id)
          .collection('workouts')
          .doc(workoutId)
          .collection('exercises')
          .get();

      List<Exercise> exercises = [];
      for (DocumentSnapshot exerciseSnapshot in exercisesQuerySnapshot.docs) {
        exercises.add(Exercise.fromDocument(exerciseSnapshot as DocumentSnapshot<Map<String, dynamic>>));
      }

      return exercises;
    } catch (e) {
      throw FirestoreApiException(
        message: 'Failed to get exercises',
        devDetails: e.toString(),
      );
    }
  }

  Future<String> createWorkout({required WorkoutDto workout}) async {
    log.i('workout: $workout');

    User currentUser = locator<UserService>().currentUser;

    try {
      DocumentReference documentReference = await usersCollection
          .doc(currentUser.id)
          .collection('workouts')
          .add(workout.toJson());
      log.v('workout created at ${documentReference.path}');
      return documentReference.id;
    } catch (e) {
      throw FirestoreApiException(
        message: 'Failed to create new workout',
        devDetails: e.toString(),
      );
    }
  }

  Future<String> createExercise({required ExerciseDto exercise, required String workoutId}) async {
    log.i('exercise: $exercise');

    User currentUser = locator<UserService>().currentUser;
    try {
      DocumentReference documentReference = await usersCollection
          .doc(currentUser.id)
          .collection('workouts')
          .doc(workoutId)
          .collection('exercises')
          .add(exercise.toJson());

      log.v('exercise created at ${documentReference.path}');
      return documentReference.id;
    } catch (e) {
      throw FirestoreApiException(
        message: 'Failed to create new exercise',
        devDetails: e.toString(),
      );
    }
  }


  Future<String> storePlanTemplate({required String templateJsonString}) async {
    log.i('planTemplate: $templateJsonString');

    User currentUser = locator<UserService>().currentUser;

    try {
      DocumentReference documentReference = await usersCollection
          .doc(currentUser.id)
          .collection('plan_templates')
          .add(
            {
              'template': templateJsonString,
            }
          );
      log.v('planTemplate created at ${documentReference.path}');
      return documentReference.id;
    } catch (e) {
      throw FirestoreApiException(
        message: 'Failed to create new planTemplate',
        devDetails: e.toString(),
      );
    }
  }

  Future<void> updatePlanTemplate({required String planTemplateId, required String templateJsonString}) async {
    log.i('planTemplateId: $planTemplateId, templateJsonString: $templateJsonString');

    User currentUser = locator<UserService>().currentUser;

    try {
      await usersCollection
          .doc(currentUser.id)
          .collection('plan_templates')
          .doc(planTemplateId)
          .update(
            {
              'template': templateJsonString,
            }
          );
      log.v('planTemplate updated');
    } catch (e) {
      throw FirestoreApiException(
        message: 'Failed to update planTemplate',
        devDetails: e.toString(),
      );
    }
  }

  Future<List<Map<String, String>>> getPlanTemplates() async {
    log.i('getPlanTemplates');
    User currentUser = locator<UserService>().currentUser;

    List<Map<String, String>> planTemplates = [];

    try {
      QuerySnapshot<Map<String, dynamic>> planTemplatesQuerySnapshot = await usersCollection
          .doc(currentUser.id)
          .collection('plan_templates')
          .get();

      for (DocumentSnapshot<Map<String, dynamic>> planTemplateSnapshot in planTemplatesQuerySnapshot.docs) {
        planTemplates.add({
          'id': planTemplateSnapshot.id,
          'template': planTemplateSnapshot.data()!['template'],
        });
      }
      log.v('Found ${planTemplates.length} planTemplates');
      return planTemplates;
    } catch (e) {
      throw FirestoreApiException(
        message: 'Failed to get planTemplates',
        devDetails: e.toString(),
      );
    }
  }
}