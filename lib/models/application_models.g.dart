// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
    };

_$_TPlanDto _$$_TPlanDtoFromJson(Map<String, dynamic> json) => _$_TPlanDto(
      name: json['name'] as String,
      current: json['current'] as bool,
      workouts: (json['workouts'] as List<dynamic>)
          .map((e) => TWorkout.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TPlanDtoToJson(_$_TPlanDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'current': instance.current,
      'workouts': TPlanDto.tWorkoutsToJson(instance.workouts),
    };

_$_TWorkout _$$_TWorkoutFromJson(Map<String, dynamic> json) => _$_TWorkout(
      name: json['name'] as String,
      notes: json['notes'] as String?,
      exercises: TWorkout.tExercisesFromJson(json['exercises'] as List),
    );

Map<String, dynamic> _$$_TWorkoutToJson(_$_TWorkout instance) =>
    <String, dynamic>{
      'name': instance.name,
      'notes': instance.notes,
      'exercises': TWorkout.tExercisesToJson(instance.exercises),
    };

_$_TExercise _$$_TExerciseFromJson(Map<String, dynamic> json) => _$_TExercise(
      name: json['name'] as String,
      machineSettings: json['machineSettings'] as String?,
      weightIncrement: (json['weightIncrement'] as num?)?.toDouble(),
      index: json['index'] as int?,
      unit: json['unit'] as String? ?? 'kg',
      defaultNumberOfSets: json['defaultNumberOfSets'] as int?,
    );

Map<String, dynamic> _$$_TExerciseToJson(_$_TExercise instance) =>
    <String, dynamic>{
      'name': instance.name,
      'machineSettings': instance.machineSettings,
      'weightIncrement': instance.weightIncrement,
      'index': instance.index,
      'unit': instance.unit,
      'defaultNumberOfSets': instance.defaultNumberOfSets,
    };

_$_Workout _$$_WorkoutFromJson(Map<String, dynamic> json) => _$_Workout(
      id: json['id'] as String,
      name: json['name'] as String,
      notes: json['notes'] as String,
      date: DateTime.parse(json['date'] as String),
      exercises: Workout.exercisesFromJson(json['exercises'] as List),
    );

Map<String, dynamic> _$$_WorkoutToJson(_$_Workout instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'notes': instance.notes,
      'date': instance.date.toIso8601String(),
      'exercises': instance.exercises,
    };

_$_WorkoutDto _$$_WorkoutDtoFromJson(Map<String, dynamic> json) =>
    _$_WorkoutDto(
      name: json['name'] as String,
      notes: json['notes'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_WorkoutDtoToJson(_$_WorkoutDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'notes': instance.notes,
      'date': instance.date.toIso8601String(),
    };

_$_Exercise _$$_ExerciseFromJson(Map<String, dynamic> json) => _$_Exercise(
      id: json['id'] as String,
      name: json['name'] as String,
      index: json['index'] as int,
      machineSettings: json['machineSettings'] as String,
      weightIncrement: (json['weightIncrement'] as num).toDouble(),
      unit: json['unit'] as String,
      defaultNumberOfSets: json['defaultNumberOfSets'] as int,
      sets: (json['sets'] as List<dynamic>?)
          ?.map((e) => Set.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ExerciseToJson(_$_Exercise instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'index': instance.index,
      'machineSettings': instance.machineSettings,
      'weightIncrement': instance.weightIncrement,
      'unit': instance.unit,
      'defaultNumberOfSets': instance.defaultNumberOfSets,
      'sets': instance.sets,
    };

_$_ExerciseDto _$$_ExerciseDtoFromJson(Map<String, dynamic> json) =>
    _$_ExerciseDto(
      name: json['name'] as String,
      index: json['index'] as int,
      machineSettings: json['machineSettings'] as String,
      weightIncrement: (json['weightIncrement'] as num).toDouble(),
      unit: json['unit'] as String,
      defaultNumberOfSets: json['defaultNumberOfSets'] as int,
    );

Map<String, dynamic> _$$_ExerciseDtoToJson(_$_ExerciseDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'index': instance.index,
      'machineSettings': instance.machineSettings,
      'weightIncrement': instance.weightIncrement,
      'unit': instance.unit,
      'defaultNumberOfSets': instance.defaultNumberOfSets,
    };

_$_Set _$$_SetFromJson(Map<String, dynamic> json) => _$_Set(
      id: json['id'] as String,
      index: json['index'] as int,
      reps: json['reps'] as int,
      weight: (json['weight'] as num).toDouble(),
      isDropset: json['isDropset'] as bool,
    );

Map<String, dynamic> _$$_SetToJson(_$_Set instance) => <String, dynamic>{
      'id': instance.id,
      'index': instance.index,
      'reps': instance.reps,
      'weight': instance.weight,
      'isDropset': instance.isDropset,
    };

_$_SetDto _$$_SetDtoFromJson(Map<String, dynamic> json) => _$_SetDto(
      index: json['index'] as int,
      reps: json['reps'] as int,
      weight: (json['weight'] as num).toDouble(),
      isDropset: json['isDropset'] as bool,
    );

Map<String, dynamic> _$$_SetDtoToJson(_$_SetDto instance) => <String, dynamic>{
      'index': instance.index,
      'reps': instance.reps,
      'weight': instance.weight,
      'isDropset': instance.isDropset,
    };
