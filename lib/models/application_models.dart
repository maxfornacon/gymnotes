import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_models.freezed.dart';
part 'application_models.g.dart';

@freezed
class User with _$User {
  factory User({
    required String id,
    String? email,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}


/// Template classes used to store a workout plan
@freezed
class TPlan with _$TPlan {
  factory TPlan({
    required String id,
    required String name,
    required bool current,
    @JsonKey(
      fromJson: TPlan.tWorkoutsFromJson,
      toJson: TPlan.tWorkoutsToJson,
    )
    required List<TWorkout> workouts,
  }) = _TPlan;

  static TPlanDto toTPlanDto(TPlan plan) => TPlanDto(
    name: plan.name,
    current: plan.current,
    workouts: plan.workouts
  );

  factory TPlan.fromJson(String id, Map<String, dynamic> json) {

    List<Map<String, dynamic>> workouts = [];
    for (Map<String, dynamic> workout in json['workouts']) {
      workouts.add(workout);
    }

    return TPlan(
      id: id,
      name: json['name'],
      current: json['current'],
      workouts: TPlan.tWorkoutsFromJson(workouts),
    );
  }

  static List<TWorkout> tWorkoutsFromJson(List<Map<String, dynamic>> list) {
    return list.map((e) => TWorkout.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>> tWorkoutsToJson(List<TWorkout> list) {
    return list.map((e) => e.toJson()).toList();
  }
}

@freezed
class TPlanDto with _$TPlanDto {
  factory TPlanDto({
    required String name,
    required bool current,
    @JsonKey(
      toJson: TPlanDto.tWorkoutsToJson,
    )
    required List<TWorkout> workouts,
  }) = _TPlanDto;

  factory TPlanDto.fromJson(Map<String, dynamic> json) =>
      _$TPlanDtoFromJson(json);

  static List<Map<String, dynamic>> tWorkoutsToJson(List<TWorkout> list) {
    return list.map((e) => e.toJson()).toList();
  }
}

@freezed
class TWorkout with _$TWorkout {
  factory TWorkout({
    required String name,
    required String? notes,
    @JsonKey(
      fromJson: TWorkout.tExercisesFromJson,
      toJson: TWorkout.tExercisesToJson,
    )
    required List<TExercise> exercises,
  }) = _TWorkout;

  factory TWorkout.fromJson(Map<String, dynamic> json) =>
      _$TWorkoutFromJson(json);

  static List<TExercise> tExercisesFromJson(List<dynamic> list) {
    return list.map((e) => TExercise.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>> tExercisesToJson(List<TExercise> list) {
    return list.map((e) => e.toJson()).toList();
  }
}

@freezed
class TExercise with _$TExercise {
  factory TExercise({
    required String name,
    required String? machineSettings,
    required double? weightIncrement,
    required int? index,
    @JsonKey(defaultValue: 'kg')
    required String? unit,
    required int? defaultNumberOfSets,
  }) = _TExercise;

  factory TExercise.fromJson(Map<String, dynamic> json) =>
      _$TExerciseFromJson(json);
}

/// Data classes used to handle completed workouts

@freezed
class Workout with _$Workout {
  factory Workout({
    required String id,
    required String name,
    required String notes,
    required DateTime date,
    @JsonKey(
      fromJson: Workout.exercisesFromJson,
      // toJson: Workout.exercisesToJson
    )
    required List<Exercise> exercises,
  }) = _Workout;

  factory Workout.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc, List<Exercise> exercises) =>
      Workout(
        id: doc.id,
        name: doc.data()!['name'],
        notes: doc.data()!['notes'],
        date: DateTime.parse(doc.data()!['date']),
        exercises: exercises,
      );

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);

  static exercisesFromJson(List<dynamic> listOfExercises) => listOfExercises.isEmpty ? []
      : listOfExercises.map((item) => Exercise.fromJson(item)).toList();

// static exercisesToJson(List<Exercise?> items) => items.isEmpty ? []
//     : items.map((item) => Exercise.toJson()).toList();
}

@freezed
class WorkoutDto with _$WorkoutDto {
  factory WorkoutDto({
    required String name,
    required String notes,
    required DateTime date,
  }) = _WorkoutDto;

  factory WorkoutDto.fromJson(Map<String, dynamic> json) =>
      _$WorkoutDtoFromJson(json);
}

@freezed
class Exercise with _$Exercise {
  factory Exercise({
    required String id,
    required String name,
    required int index,
    required String machineSettings,
    required double weightIncrement,
    required String unit,
    required int defaultNumberOfSets,
    required List<Set>? sets,
  }) = _Exercise;

  factory Exercise.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc, QuerySnapshot<Map<String, dynamic>> setsSnapshot) {
    List<Set> sets = setsSnapshot.docs.isEmpty ? []
        : setsSnapshot.docs.map((setDoc) => Set.fromDocument(setDoc)).toList();
    sets.sort((a, b) => a.index.compareTo(b.index));
    return Exercise(
      id: doc.id,
      name: doc.data()!['name'],
      index: doc.data()!['index'],
      machineSettings: doc.data()!['machineSettings'],
      weightIncrement: doc.data()!['weightIncrement'],
      unit: doc.data()!['unit'],
      defaultNumberOfSets: doc.data()!['defaultNumberOfSets'],
      sets: sets,
    );
  }

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
}

@freezed
class ExerciseDto with _$ExerciseDto {
  factory ExerciseDto({
    required String name,
    required int index,
    required String machineSettings,
    required double weightIncrement,
    required String unit,
    required int defaultNumberOfSets,
  }) = _ExerciseDto;

  factory ExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDtoFromJson(json);
}


@freezed
class Set with _$Set {
  factory Set({
    required String id,
    required int index,
    required int reps,
    required double weight,
    required bool isDropset,
  }) = _Set;

  static Set fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) =>
      Set(
        id: doc.id,
        index: doc.data()!['index'],
        reps: doc.data()!['reps'],
        weight: doc.data()!['weight'],
        isDropset: doc.data()!['isDropset'],
      );

  factory Set.fromJson(Map<String, dynamic> json) => _$SetFromJson(json);
}

@freezed
class SetDto with _$SetDto {
  factory SetDto({
    required int index,
    required int reps,
    required double weight,
    required bool isDropset,
  }) = _SetDto;

  factory SetDto.fromJson(Map<String, dynamic> json) => _$SetDtoFromJson(json);
}