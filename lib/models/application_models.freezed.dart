// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'application_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call({String id, String? email});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call({String id, String? email});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, (v) => _then(v as _$_User));

  @override
  _$_User get _value => super._value as _$_User;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
  }) {
    return _then(_$_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  _$_User({required this.id, this.email});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String id;
  @override
  final String? email;

  @override
  String toString() {
    return 'User(id: $id, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User({required final String id, final String? email}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TPlan {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get current => throw _privateConstructorUsedError;
  @JsonKey(fromJson: TPlan.tWorkoutsFromJson, toJson: TPlan.tWorkoutsToJson)
  List<TWorkout> get workouts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TPlanCopyWith<TPlan> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TPlanCopyWith<$Res> {
  factory $TPlanCopyWith(TPlan value, $Res Function(TPlan) then) =
      _$TPlanCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      bool current,
      @JsonKey(fromJson: TPlan.tWorkoutsFromJson, toJson: TPlan.tWorkoutsToJson)
          List<TWorkout> workouts});
}

/// @nodoc
class _$TPlanCopyWithImpl<$Res> implements $TPlanCopyWith<$Res> {
  _$TPlanCopyWithImpl(this._value, this._then);

  final TPlan _value;
  // ignore: unused_field
  final $Res Function(TPlan) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? current = freezed,
    Object? workouts = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      current: current == freezed
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool,
      workouts: workouts == freezed
          ? _value.workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<TWorkout>,
    ));
  }
}

/// @nodoc
abstract class _$$_TPlanCopyWith<$Res> implements $TPlanCopyWith<$Res> {
  factory _$$_TPlanCopyWith(_$_TPlan value, $Res Function(_$_TPlan) then) =
      __$$_TPlanCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      bool current,
      @JsonKey(fromJson: TPlan.tWorkoutsFromJson, toJson: TPlan.tWorkoutsToJson)
          List<TWorkout> workouts});
}

/// @nodoc
class __$$_TPlanCopyWithImpl<$Res> extends _$TPlanCopyWithImpl<$Res>
    implements _$$_TPlanCopyWith<$Res> {
  __$$_TPlanCopyWithImpl(_$_TPlan _value, $Res Function(_$_TPlan) _then)
      : super(_value, (v) => _then(v as _$_TPlan));

  @override
  _$_TPlan get _value => super._value as _$_TPlan;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? current = freezed,
    Object? workouts = freezed,
  }) {
    return _then(_$_TPlan(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      current: current == freezed
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool,
      workouts: workouts == freezed
          ? _value._workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<TWorkout>,
    ));
  }
}

/// @nodoc

class _$_TPlan implements _TPlan {
  _$_TPlan(
      {required this.id,
      required this.name,
      required this.current,
      @JsonKey(fromJson: TPlan.tWorkoutsFromJson, toJson: TPlan.tWorkoutsToJson)
          required final List<TWorkout> workouts})
      : _workouts = workouts;

  @override
  final String id;
  @override
  final String name;
  @override
  final bool current;
  final List<TWorkout> _workouts;
  @override
  @JsonKey(fromJson: TPlan.tWorkoutsFromJson, toJson: TPlan.tWorkoutsToJson)
  List<TWorkout> get workouts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workouts);
  }

  @override
  String toString() {
    return 'TPlan(id: $id, name: $name, current: $current, workouts: $workouts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TPlan &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.current, current) &&
            const DeepCollectionEquality().equals(other._workouts, _workouts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(current),
      const DeepCollectionEquality().hash(_workouts));

  @JsonKey(ignore: true)
  @override
  _$$_TPlanCopyWith<_$_TPlan> get copyWith =>
      __$$_TPlanCopyWithImpl<_$_TPlan>(this, _$identity);
}

abstract class _TPlan implements TPlan {
  factory _TPlan(
      {required final String id,
      required final String name,
      required final bool current,
      @JsonKey(fromJson: TPlan.tWorkoutsFromJson, toJson: TPlan.tWorkoutsToJson)
          required final List<TWorkout> workouts}) = _$_TPlan;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get current;
  @override
  @JsonKey(fromJson: TPlan.tWorkoutsFromJson, toJson: TPlan.tWorkoutsToJson)
  List<TWorkout> get workouts;
  @override
  @JsonKey(ignore: true)
  _$$_TPlanCopyWith<_$_TPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

TPlanDto _$TPlanDtoFromJson(Map<String, dynamic> json) {
  return _TPlanDto.fromJson(json);
}

/// @nodoc
mixin _$TPlanDto {
  String get name => throw _privateConstructorUsedError;
  bool get current => throw _privateConstructorUsedError;
  @JsonKey(toJson: TPlanDto.tWorkoutsToJson)
  List<TWorkout> get workouts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TPlanDtoCopyWith<TPlanDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TPlanDtoCopyWith<$Res> {
  factory $TPlanDtoCopyWith(TPlanDto value, $Res Function(TPlanDto) then) =
      _$TPlanDtoCopyWithImpl<$Res>;
  $Res call(
      {String name,
      bool current,
      @JsonKey(toJson: TPlanDto.tWorkoutsToJson) List<TWorkout> workouts});
}

/// @nodoc
class _$TPlanDtoCopyWithImpl<$Res> implements $TPlanDtoCopyWith<$Res> {
  _$TPlanDtoCopyWithImpl(this._value, this._then);

  final TPlanDto _value;
  // ignore: unused_field
  final $Res Function(TPlanDto) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? current = freezed,
    Object? workouts = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      current: current == freezed
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool,
      workouts: workouts == freezed
          ? _value.workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<TWorkout>,
    ));
  }
}

/// @nodoc
abstract class _$$_TPlanDtoCopyWith<$Res> implements $TPlanDtoCopyWith<$Res> {
  factory _$$_TPlanDtoCopyWith(
          _$_TPlanDto value, $Res Function(_$_TPlanDto) then) =
      __$$_TPlanDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      bool current,
      @JsonKey(toJson: TPlanDto.tWorkoutsToJson) List<TWorkout> workouts});
}

/// @nodoc
class __$$_TPlanDtoCopyWithImpl<$Res> extends _$TPlanDtoCopyWithImpl<$Res>
    implements _$$_TPlanDtoCopyWith<$Res> {
  __$$_TPlanDtoCopyWithImpl(
      _$_TPlanDto _value, $Res Function(_$_TPlanDto) _then)
      : super(_value, (v) => _then(v as _$_TPlanDto));

  @override
  _$_TPlanDto get _value => super._value as _$_TPlanDto;

  @override
  $Res call({
    Object? name = freezed,
    Object? current = freezed,
    Object? workouts = freezed,
  }) {
    return _then(_$_TPlanDto(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      current: current == freezed
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool,
      workouts: workouts == freezed
          ? _value._workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<TWorkout>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TPlanDto implements _TPlanDto {
  _$_TPlanDto(
      {required this.name,
      required this.current,
      @JsonKey(toJson: TPlanDto.tWorkoutsToJson)
          required final List<TWorkout> workouts})
      : _workouts = workouts;

  factory _$_TPlanDto.fromJson(Map<String, dynamic> json) =>
      _$$_TPlanDtoFromJson(json);

  @override
  final String name;
  @override
  final bool current;
  final List<TWorkout> _workouts;
  @override
  @JsonKey(toJson: TPlanDto.tWorkoutsToJson)
  List<TWorkout> get workouts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workouts);
  }

  @override
  String toString() {
    return 'TPlanDto(name: $name, current: $current, workouts: $workouts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TPlanDto &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.current, current) &&
            const DeepCollectionEquality().equals(other._workouts, _workouts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(current),
      const DeepCollectionEquality().hash(_workouts));

  @JsonKey(ignore: true)
  @override
  _$$_TPlanDtoCopyWith<_$_TPlanDto> get copyWith =>
      __$$_TPlanDtoCopyWithImpl<_$_TPlanDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TPlanDtoToJson(
      this,
    );
  }
}

abstract class _TPlanDto implements TPlanDto {
  factory _TPlanDto(
      {required final String name,
      required final bool current,
      @JsonKey(toJson: TPlanDto.tWorkoutsToJson)
          required final List<TWorkout> workouts}) = _$_TPlanDto;

  factory _TPlanDto.fromJson(Map<String, dynamic> json) = _$_TPlanDto.fromJson;

  @override
  String get name;
  @override
  bool get current;
  @override
  @JsonKey(toJson: TPlanDto.tWorkoutsToJson)
  List<TWorkout> get workouts;
  @override
  @JsonKey(ignore: true)
  _$$_TPlanDtoCopyWith<_$_TPlanDto> get copyWith =>
      throw _privateConstructorUsedError;
}

TWorkout _$TWorkoutFromJson(Map<String, dynamic> json) {
  return _TWorkout.fromJson(json);
}

/// @nodoc
mixin _$TWorkout {
  String get name => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: TWorkout.tExercisesFromJson, toJson: TWorkout.tExercisesToJson)
  List<TExercise> get exercises => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TWorkoutCopyWith<TWorkout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TWorkoutCopyWith<$Res> {
  factory $TWorkoutCopyWith(TWorkout value, $Res Function(TWorkout) then) =
      _$TWorkoutCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String? notes,
      @JsonKey(fromJson: TWorkout.tExercisesFromJson, toJson: TWorkout.tExercisesToJson)
          List<TExercise> exercises});
}

/// @nodoc
class _$TWorkoutCopyWithImpl<$Res> implements $TWorkoutCopyWith<$Res> {
  _$TWorkoutCopyWithImpl(this._value, this._then);

  final TWorkout _value;
  // ignore: unused_field
  final $Res Function(TWorkout) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? notes = freezed,
    Object? exercises = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      exercises: exercises == freezed
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<TExercise>,
    ));
  }
}

/// @nodoc
abstract class _$$_TWorkoutCopyWith<$Res> implements $TWorkoutCopyWith<$Res> {
  factory _$$_TWorkoutCopyWith(
          _$_TWorkout value, $Res Function(_$_TWorkout) then) =
      __$$_TWorkoutCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String? notes,
      @JsonKey(fromJson: TWorkout.tExercisesFromJson, toJson: TWorkout.tExercisesToJson)
          List<TExercise> exercises});
}

/// @nodoc
class __$$_TWorkoutCopyWithImpl<$Res> extends _$TWorkoutCopyWithImpl<$Res>
    implements _$$_TWorkoutCopyWith<$Res> {
  __$$_TWorkoutCopyWithImpl(
      _$_TWorkout _value, $Res Function(_$_TWorkout) _then)
      : super(_value, (v) => _then(v as _$_TWorkout));

  @override
  _$_TWorkout get _value => super._value as _$_TWorkout;

  @override
  $Res call({
    Object? name = freezed,
    Object? notes = freezed,
    Object? exercises = freezed,
  }) {
    return _then(_$_TWorkout(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      exercises: exercises == freezed
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<TExercise>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TWorkout implements _TWorkout {
  _$_TWorkout(
      {required this.name,
      required this.notes,
      @JsonKey(fromJson: TWorkout.tExercisesFromJson, toJson: TWorkout.tExercisesToJson)
          required final List<TExercise> exercises})
      : _exercises = exercises;

  factory _$_TWorkout.fromJson(Map<String, dynamic> json) =>
      _$$_TWorkoutFromJson(json);

  @override
  final String name;
  @override
  final String? notes;
  final List<TExercise> _exercises;
  @override
  @JsonKey(
      fromJson: TWorkout.tExercisesFromJson, toJson: TWorkout.tExercisesToJson)
  List<TExercise> get exercises {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'TWorkout(name: $name, notes: $notes, exercises: $exercises)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TWorkout &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.notes, notes) &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(notes),
      const DeepCollectionEquality().hash(_exercises));

  @JsonKey(ignore: true)
  @override
  _$$_TWorkoutCopyWith<_$_TWorkout> get copyWith =>
      __$$_TWorkoutCopyWithImpl<_$_TWorkout>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TWorkoutToJson(
      this,
    );
  }
}

abstract class _TWorkout implements TWorkout {
  factory _TWorkout(
      {required final String name,
      required final String? notes,
      @JsonKey(fromJson: TWorkout.tExercisesFromJson, toJson: TWorkout.tExercisesToJson)
          required final List<TExercise> exercises}) = _$_TWorkout;

  factory _TWorkout.fromJson(Map<String, dynamic> json) = _$_TWorkout.fromJson;

  @override
  String get name;
  @override
  String? get notes;
  @override
  @JsonKey(
      fromJson: TWorkout.tExercisesFromJson, toJson: TWorkout.tExercisesToJson)
  List<TExercise> get exercises;
  @override
  @JsonKey(ignore: true)
  _$$_TWorkoutCopyWith<_$_TWorkout> get copyWith =>
      throw _privateConstructorUsedError;
}

TExercise _$TExerciseFromJson(Map<String, dynamic> json) {
  return _TExercise.fromJson(json);
}

/// @nodoc
mixin _$TExercise {
  String get name => throw _privateConstructorUsedError;
  String? get machineSettings => throw _privateConstructorUsedError;
  double? get weightIncrement => throw _privateConstructorUsedError;
  int? get index => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 'kg')
  String? get unit => throw _privateConstructorUsedError;
  int? get defaultNumberOfSets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TExerciseCopyWith<TExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TExerciseCopyWith<$Res> {
  factory $TExerciseCopyWith(TExercise value, $Res Function(TExercise) then) =
      _$TExerciseCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String? machineSettings,
      double? weightIncrement,
      int? index,
      @JsonKey(defaultValue: 'kg') String? unit,
      int? defaultNumberOfSets});
}

/// @nodoc
class _$TExerciseCopyWithImpl<$Res> implements $TExerciseCopyWith<$Res> {
  _$TExerciseCopyWithImpl(this._value, this._then);

  final TExercise _value;
  // ignore: unused_field
  final $Res Function(TExercise) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? machineSettings = freezed,
    Object? weightIncrement = freezed,
    Object? index = freezed,
    Object? unit = freezed,
    Object? defaultNumberOfSets = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      machineSettings: machineSettings == freezed
          ? _value.machineSettings
          : machineSettings // ignore: cast_nullable_to_non_nullable
              as String?,
      weightIncrement: weightIncrement == freezed
          ? _value.weightIncrement
          : weightIncrement // ignore: cast_nullable_to_non_nullable
              as double?,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultNumberOfSets: defaultNumberOfSets == freezed
          ? _value.defaultNumberOfSets
          : defaultNumberOfSets // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_TExerciseCopyWith<$Res> implements $TExerciseCopyWith<$Res> {
  factory _$$_TExerciseCopyWith(
          _$_TExercise value, $Res Function(_$_TExercise) then) =
      __$$_TExerciseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String? machineSettings,
      double? weightIncrement,
      int? index,
      @JsonKey(defaultValue: 'kg') String? unit,
      int? defaultNumberOfSets});
}

/// @nodoc
class __$$_TExerciseCopyWithImpl<$Res> extends _$TExerciseCopyWithImpl<$Res>
    implements _$$_TExerciseCopyWith<$Res> {
  __$$_TExerciseCopyWithImpl(
      _$_TExercise _value, $Res Function(_$_TExercise) _then)
      : super(_value, (v) => _then(v as _$_TExercise));

  @override
  _$_TExercise get _value => super._value as _$_TExercise;

  @override
  $Res call({
    Object? name = freezed,
    Object? machineSettings = freezed,
    Object? weightIncrement = freezed,
    Object? index = freezed,
    Object? unit = freezed,
    Object? defaultNumberOfSets = freezed,
  }) {
    return _then(_$_TExercise(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      machineSettings: machineSettings == freezed
          ? _value.machineSettings
          : machineSettings // ignore: cast_nullable_to_non_nullable
              as String?,
      weightIncrement: weightIncrement == freezed
          ? _value.weightIncrement
          : weightIncrement // ignore: cast_nullable_to_non_nullable
              as double?,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultNumberOfSets: defaultNumberOfSets == freezed
          ? _value.defaultNumberOfSets
          : defaultNumberOfSets // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TExercise implements _TExercise {
  _$_TExercise(
      {required this.name,
      required this.machineSettings,
      required this.weightIncrement,
      required this.index,
      @JsonKey(defaultValue: 'kg') required this.unit,
      required this.defaultNumberOfSets});

  factory _$_TExercise.fromJson(Map<String, dynamic> json) =>
      _$$_TExerciseFromJson(json);

  @override
  final String name;
  @override
  final String? machineSettings;
  @override
  final double? weightIncrement;
  @override
  final int? index;
  @override
  @JsonKey(defaultValue: 'kg')
  final String? unit;
  @override
  final int? defaultNumberOfSets;

  @override
  String toString() {
    return 'TExercise(name: $name, machineSettings: $machineSettings, weightIncrement: $weightIncrement, index: $index, unit: $unit, defaultNumberOfSets: $defaultNumberOfSets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TExercise &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.machineSettings, machineSettings) &&
            const DeepCollectionEquality()
                .equals(other.weightIncrement, weightIncrement) &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality().equals(other.unit, unit) &&
            const DeepCollectionEquality()
                .equals(other.defaultNumberOfSets, defaultNumberOfSets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(machineSettings),
      const DeepCollectionEquality().hash(weightIncrement),
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(unit),
      const DeepCollectionEquality().hash(defaultNumberOfSets));

  @JsonKey(ignore: true)
  @override
  _$$_TExerciseCopyWith<_$_TExercise> get copyWith =>
      __$$_TExerciseCopyWithImpl<_$_TExercise>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TExerciseToJson(
      this,
    );
  }
}

abstract class _TExercise implements TExercise {
  factory _TExercise(
      {required final String name,
      required final String? machineSettings,
      required final double? weightIncrement,
      required final int? index,
      @JsonKey(defaultValue: 'kg') required final String? unit,
      required final int? defaultNumberOfSets}) = _$_TExercise;

  factory _TExercise.fromJson(Map<String, dynamic> json) =
      _$_TExercise.fromJson;

  @override
  String get name;
  @override
  String? get machineSettings;
  @override
  double? get weightIncrement;
  @override
  int? get index;
  @override
  @JsonKey(defaultValue: 'kg')
  String? get unit;
  @override
  int? get defaultNumberOfSets;
  @override
  @JsonKey(ignore: true)
  _$$_TExerciseCopyWith<_$_TExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

Workout _$WorkoutFromJson(Map<String, dynamic> json) {
  return _Workout.fromJson(json);
}

/// @nodoc
mixin _$Workout {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Workout.exercisesFromJson)
  List<Exercise> get exercises => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutCopyWith<Workout> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutCopyWith<$Res> {
  factory $WorkoutCopyWith(Workout value, $Res Function(Workout) then) =
      _$WorkoutCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String notes,
      DateTime date,
      @JsonKey(fromJson: Workout.exercisesFromJson) List<Exercise> exercises});
}

/// @nodoc
class _$WorkoutCopyWithImpl<$Res> implements $WorkoutCopyWith<$Res> {
  _$WorkoutCopyWithImpl(this._value, this._then);

  final Workout _value;
  // ignore: unused_field
  final $Res Function(Workout) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? notes = freezed,
    Object? date = freezed,
    Object? exercises = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      exercises: exercises == freezed
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
    ));
  }
}

/// @nodoc
abstract class _$$_WorkoutCopyWith<$Res> implements $WorkoutCopyWith<$Res> {
  factory _$$_WorkoutCopyWith(
          _$_Workout value, $Res Function(_$_Workout) then) =
      __$$_WorkoutCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String notes,
      DateTime date,
      @JsonKey(fromJson: Workout.exercisesFromJson) List<Exercise> exercises});
}

/// @nodoc
class __$$_WorkoutCopyWithImpl<$Res> extends _$WorkoutCopyWithImpl<$Res>
    implements _$$_WorkoutCopyWith<$Res> {
  __$$_WorkoutCopyWithImpl(_$_Workout _value, $Res Function(_$_Workout) _then)
      : super(_value, (v) => _then(v as _$_Workout));

  @override
  _$_Workout get _value => super._value as _$_Workout;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? notes = freezed,
    Object? date = freezed,
    Object? exercises = freezed,
  }) {
    return _then(_$_Workout(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      exercises: exercises == freezed
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Workout implements _Workout {
  _$_Workout(
      {required this.id,
      required this.name,
      required this.notes,
      required this.date,
      @JsonKey(fromJson: Workout.exercisesFromJson)
          required final List<Exercise> exercises})
      : _exercises = exercises;

  factory _$_Workout.fromJson(Map<String, dynamic> json) =>
      _$$_WorkoutFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String notes;
  @override
  final DateTime date;
  final List<Exercise> _exercises;
  @override
  @JsonKey(fromJson: Workout.exercisesFromJson)
  List<Exercise> get exercises {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'Workout(id: $id, name: $name, notes: $notes, date: $date, exercises: $exercises)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Workout &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.notes, notes) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(notes),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(_exercises));

  @JsonKey(ignore: true)
  @override
  _$$_WorkoutCopyWith<_$_Workout> get copyWith =>
      __$$_WorkoutCopyWithImpl<_$_Workout>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkoutToJson(
      this,
    );
  }
}

abstract class _Workout implements Workout {
  factory _Workout(
      {required final String id,
      required final String name,
      required final String notes,
      required final DateTime date,
      @JsonKey(fromJson: Workout.exercisesFromJson)
          required final List<Exercise> exercises}) = _$_Workout;

  factory _Workout.fromJson(Map<String, dynamic> json) = _$_Workout.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get notes;
  @override
  DateTime get date;
  @override
  @JsonKey(fromJson: Workout.exercisesFromJson)
  List<Exercise> get exercises;
  @override
  @JsonKey(ignore: true)
  _$$_WorkoutCopyWith<_$_Workout> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkoutDto _$WorkoutDtoFromJson(Map<String, dynamic> json) {
  return _WorkoutDto.fromJson(json);
}

/// @nodoc
mixin _$WorkoutDto {
  String get name => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutDtoCopyWith<WorkoutDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutDtoCopyWith<$Res> {
  factory $WorkoutDtoCopyWith(
          WorkoutDto value, $Res Function(WorkoutDto) then) =
      _$WorkoutDtoCopyWithImpl<$Res>;
  $Res call({String name, String notes, DateTime date});
}

/// @nodoc
class _$WorkoutDtoCopyWithImpl<$Res> implements $WorkoutDtoCopyWith<$Res> {
  _$WorkoutDtoCopyWithImpl(this._value, this._then);

  final WorkoutDto _value;
  // ignore: unused_field
  final $Res Function(WorkoutDto) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? notes = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_WorkoutDtoCopyWith<$Res>
    implements $WorkoutDtoCopyWith<$Res> {
  factory _$$_WorkoutDtoCopyWith(
          _$_WorkoutDto value, $Res Function(_$_WorkoutDto) then) =
      __$$_WorkoutDtoCopyWithImpl<$Res>;
  @override
  $Res call({String name, String notes, DateTime date});
}

/// @nodoc
class __$$_WorkoutDtoCopyWithImpl<$Res> extends _$WorkoutDtoCopyWithImpl<$Res>
    implements _$$_WorkoutDtoCopyWith<$Res> {
  __$$_WorkoutDtoCopyWithImpl(
      _$_WorkoutDto _value, $Res Function(_$_WorkoutDto) _then)
      : super(_value, (v) => _then(v as _$_WorkoutDto));

  @override
  _$_WorkoutDto get _value => super._value as _$_WorkoutDto;

  @override
  $Res call({
    Object? name = freezed,
    Object? notes = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_WorkoutDto(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkoutDto implements _WorkoutDto {
  _$_WorkoutDto({required this.name, required this.notes, required this.date});

  factory _$_WorkoutDto.fromJson(Map<String, dynamic> json) =>
      _$$_WorkoutDtoFromJson(json);

  @override
  final String name;
  @override
  final String notes;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'WorkoutDto(name: $name, notes: $notes, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkoutDto &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.notes, notes) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(notes),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_WorkoutDtoCopyWith<_$_WorkoutDto> get copyWith =>
      __$$_WorkoutDtoCopyWithImpl<_$_WorkoutDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkoutDtoToJson(
      this,
    );
  }
}

abstract class _WorkoutDto implements WorkoutDto {
  factory _WorkoutDto(
      {required final String name,
      required final String notes,
      required final DateTime date}) = _$_WorkoutDto;

  factory _WorkoutDto.fromJson(Map<String, dynamic> json) =
      _$_WorkoutDto.fromJson;

  @override
  String get name;
  @override
  String get notes;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_WorkoutDtoCopyWith<_$_WorkoutDto> get copyWith =>
      throw _privateConstructorUsedError;
}

Exercise _$ExerciseFromJson(Map<String, dynamic> json) {
  return _Exercise.fromJson(json);
}

/// @nodoc
mixin _$Exercise {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  String get machineSettings => throw _privateConstructorUsedError;
  double get weightIncrement => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  int get defaultNumberOfSets => throw _privateConstructorUsedError;
  List<Set>? get sets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseCopyWith<Exercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseCopyWith<$Res> {
  factory $ExerciseCopyWith(Exercise value, $Res Function(Exercise) then) =
      _$ExerciseCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      int index,
      String machineSettings,
      double weightIncrement,
      String unit,
      int defaultNumberOfSets,
      List<Set>? sets});
}

/// @nodoc
class _$ExerciseCopyWithImpl<$Res> implements $ExerciseCopyWith<$Res> {
  _$ExerciseCopyWithImpl(this._value, this._then);

  final Exercise _value;
  // ignore: unused_field
  final $Res Function(Exercise) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? index = freezed,
    Object? machineSettings = freezed,
    Object? weightIncrement = freezed,
    Object? unit = freezed,
    Object? defaultNumberOfSets = freezed,
    Object? sets = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      machineSettings: machineSettings == freezed
          ? _value.machineSettings
          : machineSettings // ignore: cast_nullable_to_non_nullable
              as String,
      weightIncrement: weightIncrement == freezed
          ? _value.weightIncrement
          : weightIncrement // ignore: cast_nullable_to_non_nullable
              as double,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      defaultNumberOfSets: defaultNumberOfSets == freezed
          ? _value.defaultNumberOfSets
          : defaultNumberOfSets // ignore: cast_nullable_to_non_nullable
              as int,
      sets: sets == freezed
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<Set>?,
    ));
  }
}

/// @nodoc
abstract class _$$_ExerciseCopyWith<$Res> implements $ExerciseCopyWith<$Res> {
  factory _$$_ExerciseCopyWith(
          _$_Exercise value, $Res Function(_$_Exercise) then) =
      __$$_ExerciseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      int index,
      String machineSettings,
      double weightIncrement,
      String unit,
      int defaultNumberOfSets,
      List<Set>? sets});
}

/// @nodoc
class __$$_ExerciseCopyWithImpl<$Res> extends _$ExerciseCopyWithImpl<$Res>
    implements _$$_ExerciseCopyWith<$Res> {
  __$$_ExerciseCopyWithImpl(
      _$_Exercise _value, $Res Function(_$_Exercise) _then)
      : super(_value, (v) => _then(v as _$_Exercise));

  @override
  _$_Exercise get _value => super._value as _$_Exercise;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? index = freezed,
    Object? machineSettings = freezed,
    Object? weightIncrement = freezed,
    Object? unit = freezed,
    Object? defaultNumberOfSets = freezed,
    Object? sets = freezed,
  }) {
    return _then(_$_Exercise(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      machineSettings: machineSettings == freezed
          ? _value.machineSettings
          : machineSettings // ignore: cast_nullable_to_non_nullable
              as String,
      weightIncrement: weightIncrement == freezed
          ? _value.weightIncrement
          : weightIncrement // ignore: cast_nullable_to_non_nullable
              as double,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      defaultNumberOfSets: defaultNumberOfSets == freezed
          ? _value.defaultNumberOfSets
          : defaultNumberOfSets // ignore: cast_nullable_to_non_nullable
              as int,
      sets: sets == freezed
          ? _value._sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<Set>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Exercise implements _Exercise {
  _$_Exercise(
      {required this.id,
      required this.name,
      required this.index,
      required this.machineSettings,
      required this.weightIncrement,
      required this.unit,
      required this.defaultNumberOfSets,
      required final List<Set>? sets})
      : _sets = sets;

  factory _$_Exercise.fromJson(Map<String, dynamic> json) =>
      _$$_ExerciseFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int index;
  @override
  final String machineSettings;
  @override
  final double weightIncrement;
  @override
  final String unit;
  @override
  final int defaultNumberOfSets;
  final List<Set>? _sets;
  @override
  List<Set>? get sets {
    final value = _sets;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Exercise(id: $id, name: $name, index: $index, machineSettings: $machineSettings, weightIncrement: $weightIncrement, unit: $unit, defaultNumberOfSets: $defaultNumberOfSets, sets: $sets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Exercise &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality()
                .equals(other.machineSettings, machineSettings) &&
            const DeepCollectionEquality()
                .equals(other.weightIncrement, weightIncrement) &&
            const DeepCollectionEquality().equals(other.unit, unit) &&
            const DeepCollectionEquality()
                .equals(other.defaultNumberOfSets, defaultNumberOfSets) &&
            const DeepCollectionEquality().equals(other._sets, _sets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(machineSettings),
      const DeepCollectionEquality().hash(weightIncrement),
      const DeepCollectionEquality().hash(unit),
      const DeepCollectionEquality().hash(defaultNumberOfSets),
      const DeepCollectionEquality().hash(_sets));

  @JsonKey(ignore: true)
  @override
  _$$_ExerciseCopyWith<_$_Exercise> get copyWith =>
      __$$_ExerciseCopyWithImpl<_$_Exercise>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExerciseToJson(
      this,
    );
  }
}

abstract class _Exercise implements Exercise {
  factory _Exercise(
      {required final String id,
      required final String name,
      required final int index,
      required final String machineSettings,
      required final double weightIncrement,
      required final String unit,
      required final int defaultNumberOfSets,
      required final List<Set>? sets}) = _$_Exercise;

  factory _Exercise.fromJson(Map<String, dynamic> json) = _$_Exercise.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get index;
  @override
  String get machineSettings;
  @override
  double get weightIncrement;
  @override
  String get unit;
  @override
  int get defaultNumberOfSets;
  @override
  List<Set>? get sets;
  @override
  @JsonKey(ignore: true)
  _$$_ExerciseCopyWith<_$_Exercise> get copyWith =>
      throw _privateConstructorUsedError;
}

ExerciseDto _$ExerciseDtoFromJson(Map<String, dynamic> json) {
  return _ExerciseDto.fromJson(json);
}

/// @nodoc
mixin _$ExerciseDto {
  String get name => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  String get machineSettings => throw _privateConstructorUsedError;
  double get weightIncrement => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  int get defaultNumberOfSets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseDtoCopyWith<ExerciseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseDtoCopyWith<$Res> {
  factory $ExerciseDtoCopyWith(
          ExerciseDto value, $Res Function(ExerciseDto) then) =
      _$ExerciseDtoCopyWithImpl<$Res>;
  $Res call(
      {String name,
      int index,
      String machineSettings,
      double weightIncrement,
      String unit,
      int defaultNumberOfSets});
}

/// @nodoc
class _$ExerciseDtoCopyWithImpl<$Res> implements $ExerciseDtoCopyWith<$Res> {
  _$ExerciseDtoCopyWithImpl(this._value, this._then);

  final ExerciseDto _value;
  // ignore: unused_field
  final $Res Function(ExerciseDto) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? index = freezed,
    Object? machineSettings = freezed,
    Object? weightIncrement = freezed,
    Object? unit = freezed,
    Object? defaultNumberOfSets = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      machineSettings: machineSettings == freezed
          ? _value.machineSettings
          : machineSettings // ignore: cast_nullable_to_non_nullable
              as String,
      weightIncrement: weightIncrement == freezed
          ? _value.weightIncrement
          : weightIncrement // ignore: cast_nullable_to_non_nullable
              as double,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      defaultNumberOfSets: defaultNumberOfSets == freezed
          ? _value.defaultNumberOfSets
          : defaultNumberOfSets // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_ExerciseDtoCopyWith<$Res>
    implements $ExerciseDtoCopyWith<$Res> {
  factory _$$_ExerciseDtoCopyWith(
          _$_ExerciseDto value, $Res Function(_$_ExerciseDto) then) =
      __$$_ExerciseDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      int index,
      String machineSettings,
      double weightIncrement,
      String unit,
      int defaultNumberOfSets});
}

/// @nodoc
class __$$_ExerciseDtoCopyWithImpl<$Res> extends _$ExerciseDtoCopyWithImpl<$Res>
    implements _$$_ExerciseDtoCopyWith<$Res> {
  __$$_ExerciseDtoCopyWithImpl(
      _$_ExerciseDto _value, $Res Function(_$_ExerciseDto) _then)
      : super(_value, (v) => _then(v as _$_ExerciseDto));

  @override
  _$_ExerciseDto get _value => super._value as _$_ExerciseDto;

  @override
  $Res call({
    Object? name = freezed,
    Object? index = freezed,
    Object? machineSettings = freezed,
    Object? weightIncrement = freezed,
    Object? unit = freezed,
    Object? defaultNumberOfSets = freezed,
  }) {
    return _then(_$_ExerciseDto(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      machineSettings: machineSettings == freezed
          ? _value.machineSettings
          : machineSettings // ignore: cast_nullable_to_non_nullable
              as String,
      weightIncrement: weightIncrement == freezed
          ? _value.weightIncrement
          : weightIncrement // ignore: cast_nullable_to_non_nullable
              as double,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      defaultNumberOfSets: defaultNumberOfSets == freezed
          ? _value.defaultNumberOfSets
          : defaultNumberOfSets // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExerciseDto implements _ExerciseDto {
  _$_ExerciseDto(
      {required this.name,
      required this.index,
      required this.machineSettings,
      required this.weightIncrement,
      required this.unit,
      required this.defaultNumberOfSets});

  factory _$_ExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$$_ExerciseDtoFromJson(json);

  @override
  final String name;
  @override
  final int index;
  @override
  final String machineSettings;
  @override
  final double weightIncrement;
  @override
  final String unit;
  @override
  final int defaultNumberOfSets;

  @override
  String toString() {
    return 'ExerciseDto(name: $name, index: $index, machineSettings: $machineSettings, weightIncrement: $weightIncrement, unit: $unit, defaultNumberOfSets: $defaultNumberOfSets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExerciseDto &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality()
                .equals(other.machineSettings, machineSettings) &&
            const DeepCollectionEquality()
                .equals(other.weightIncrement, weightIncrement) &&
            const DeepCollectionEquality().equals(other.unit, unit) &&
            const DeepCollectionEquality()
                .equals(other.defaultNumberOfSets, defaultNumberOfSets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(machineSettings),
      const DeepCollectionEquality().hash(weightIncrement),
      const DeepCollectionEquality().hash(unit),
      const DeepCollectionEquality().hash(defaultNumberOfSets));

  @JsonKey(ignore: true)
  @override
  _$$_ExerciseDtoCopyWith<_$_ExerciseDto> get copyWith =>
      __$$_ExerciseDtoCopyWithImpl<_$_ExerciseDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExerciseDtoToJson(
      this,
    );
  }
}

abstract class _ExerciseDto implements ExerciseDto {
  factory _ExerciseDto(
      {required final String name,
      required final int index,
      required final String machineSettings,
      required final double weightIncrement,
      required final String unit,
      required final int defaultNumberOfSets}) = _$_ExerciseDto;

  factory _ExerciseDto.fromJson(Map<String, dynamic> json) =
      _$_ExerciseDto.fromJson;

  @override
  String get name;
  @override
  int get index;
  @override
  String get machineSettings;
  @override
  double get weightIncrement;
  @override
  String get unit;
  @override
  int get defaultNumberOfSets;
  @override
  @JsonKey(ignore: true)
  _$$_ExerciseDtoCopyWith<_$_ExerciseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

Set _$SetFromJson(Map<String, dynamic> json) {
  return _Set.fromJson(json);
}

/// @nodoc
mixin _$Set {
  String get id => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  int get reps => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  bool get isDropset => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetCopyWith<Set> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetCopyWith<$Res> {
  factory $SetCopyWith(Set value, $Res Function(Set) then) =
      _$SetCopyWithImpl<$Res>;
  $Res call({String id, int index, int reps, double weight, bool isDropset});
}

/// @nodoc
class _$SetCopyWithImpl<$Res> implements $SetCopyWith<$Res> {
  _$SetCopyWithImpl(this._value, this._then);

  final Set _value;
  // ignore: unused_field
  final $Res Function(Set) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? index = freezed,
    Object? reps = freezed,
    Object? weight = freezed,
    Object? isDropset = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      reps: reps == freezed
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      isDropset: isDropset == freezed
          ? _value.isDropset
          : isDropset // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SetCopyWith<$Res> implements $SetCopyWith<$Res> {
  factory _$$_SetCopyWith(_$_Set value, $Res Function(_$_Set) then) =
      __$$_SetCopyWithImpl<$Res>;
  @override
  $Res call({String id, int index, int reps, double weight, bool isDropset});
}

/// @nodoc
class __$$_SetCopyWithImpl<$Res> extends _$SetCopyWithImpl<$Res>
    implements _$$_SetCopyWith<$Res> {
  __$$_SetCopyWithImpl(_$_Set _value, $Res Function(_$_Set) _then)
      : super(_value, (v) => _then(v as _$_Set));

  @override
  _$_Set get _value => super._value as _$_Set;

  @override
  $Res call({
    Object? id = freezed,
    Object? index = freezed,
    Object? reps = freezed,
    Object? weight = freezed,
    Object? isDropset = freezed,
  }) {
    return _then(_$_Set(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      reps: reps == freezed
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      isDropset: isDropset == freezed
          ? _value.isDropset
          : isDropset // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Set implements _Set {
  _$_Set(
      {required this.id,
      required this.index,
      required this.reps,
      required this.weight,
      required this.isDropset});

  factory _$_Set.fromJson(Map<String, dynamic> json) => _$$_SetFromJson(json);

  @override
  final String id;
  @override
  final int index;
  @override
  final int reps;
  @override
  final double weight;
  @override
  final bool isDropset;

  @override
  String toString() {
    return 'Set(id: $id, index: $index, reps: $reps, weight: $weight, isDropset: $isDropset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Set &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality().equals(other.reps, reps) &&
            const DeepCollectionEquality().equals(other.weight, weight) &&
            const DeepCollectionEquality().equals(other.isDropset, isDropset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(reps),
      const DeepCollectionEquality().hash(weight),
      const DeepCollectionEquality().hash(isDropset));

  @JsonKey(ignore: true)
  @override
  _$$_SetCopyWith<_$_Set> get copyWith =>
      __$$_SetCopyWithImpl<_$_Set>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SetToJson(
      this,
    );
  }
}

abstract class _Set implements Set {
  factory _Set(
      {required final String id,
      required final int index,
      required final int reps,
      required final double weight,
      required final bool isDropset}) = _$_Set;

  factory _Set.fromJson(Map<String, dynamic> json) = _$_Set.fromJson;

  @override
  String get id;
  @override
  int get index;
  @override
  int get reps;
  @override
  double get weight;
  @override
  bool get isDropset;
  @override
  @JsonKey(ignore: true)
  _$$_SetCopyWith<_$_Set> get copyWith => throw _privateConstructorUsedError;
}

SetDto _$SetDtoFromJson(Map<String, dynamic> json) {
  return _SetDto.fromJson(json);
}

/// @nodoc
mixin _$SetDto {
  int get index => throw _privateConstructorUsedError;
  int get reps => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  bool get isDropset => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetDtoCopyWith<SetDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetDtoCopyWith<$Res> {
  factory $SetDtoCopyWith(SetDto value, $Res Function(SetDto) then) =
      _$SetDtoCopyWithImpl<$Res>;
  $Res call({int index, int reps, double weight, bool isDropset});
}

/// @nodoc
class _$SetDtoCopyWithImpl<$Res> implements $SetDtoCopyWith<$Res> {
  _$SetDtoCopyWithImpl(this._value, this._then);

  final SetDto _value;
  // ignore: unused_field
  final $Res Function(SetDto) _then;

  @override
  $Res call({
    Object? index = freezed,
    Object? reps = freezed,
    Object? weight = freezed,
    Object? isDropset = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      reps: reps == freezed
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      isDropset: isDropset == freezed
          ? _value.isDropset
          : isDropset // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SetDtoCopyWith<$Res> implements $SetDtoCopyWith<$Res> {
  factory _$$_SetDtoCopyWith(_$_SetDto value, $Res Function(_$_SetDto) then) =
      __$$_SetDtoCopyWithImpl<$Res>;
  @override
  $Res call({int index, int reps, double weight, bool isDropset});
}

/// @nodoc
class __$$_SetDtoCopyWithImpl<$Res> extends _$SetDtoCopyWithImpl<$Res>
    implements _$$_SetDtoCopyWith<$Res> {
  __$$_SetDtoCopyWithImpl(_$_SetDto _value, $Res Function(_$_SetDto) _then)
      : super(_value, (v) => _then(v as _$_SetDto));

  @override
  _$_SetDto get _value => super._value as _$_SetDto;

  @override
  $Res call({
    Object? index = freezed,
    Object? reps = freezed,
    Object? weight = freezed,
    Object? isDropset = freezed,
  }) {
    return _then(_$_SetDto(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      reps: reps == freezed
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      isDropset: isDropset == freezed
          ? _value.isDropset
          : isDropset // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SetDto implements _SetDto {
  _$_SetDto(
      {required this.index,
      required this.reps,
      required this.weight,
      required this.isDropset});

  factory _$_SetDto.fromJson(Map<String, dynamic> json) =>
      _$$_SetDtoFromJson(json);

  @override
  final int index;
  @override
  final int reps;
  @override
  final double weight;
  @override
  final bool isDropset;

  @override
  String toString() {
    return 'SetDto(index: $index, reps: $reps, weight: $weight, isDropset: $isDropset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetDto &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality().equals(other.reps, reps) &&
            const DeepCollectionEquality().equals(other.weight, weight) &&
            const DeepCollectionEquality().equals(other.isDropset, isDropset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(reps),
      const DeepCollectionEquality().hash(weight),
      const DeepCollectionEquality().hash(isDropset));

  @JsonKey(ignore: true)
  @override
  _$$_SetDtoCopyWith<_$_SetDto> get copyWith =>
      __$$_SetDtoCopyWithImpl<_$_SetDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SetDtoToJson(
      this,
    );
  }
}

abstract class _SetDto implements SetDto {
  factory _SetDto(
      {required final int index,
      required final int reps,
      required final double weight,
      required final bool isDropset}) = _$_SetDto;

  factory _SetDto.fromJson(Map<String, dynamic> json) = _$_SetDto.fromJson;

  @override
  int get index;
  @override
  int get reps;
  @override
  double get weight;
  @override
  bool get isDropset;
  @override
  @JsonKey(ignore: true)
  _$$_SetDtoCopyWith<_$_SetDto> get copyWith =>
      throw _privateConstructorUsedError;
}
