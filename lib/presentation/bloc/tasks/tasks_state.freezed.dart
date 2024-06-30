// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TasksState {
  List<Task>? get tasks => throw _privateConstructorUsedError;
  List<AppFlowyGroupData>? get groups => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  PageStateStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TasksStateCopyWith<TasksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksStateCopyWith<$Res> {
  factory $TasksStateCopyWith(
          TasksState value, $Res Function(TasksState) then) =
      _$TasksStateCopyWithImpl<$Res, TasksState>;
  @useResult
  $Res call(
      {List<Task>? tasks,
      List<AppFlowyGroupData>? groups,
      String? errorMessage,
      PageStateStatus status});
}

/// @nodoc
class _$TasksStateCopyWithImpl<$Res, $Val extends TasksState>
    implements $TasksStateCopyWith<$Res> {
  _$TasksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = freezed,
    Object? groups = freezed,
    Object? errorMessage = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      tasks: freezed == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      groups: freezed == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<AppFlowyGroupData>?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PageStateStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TasksStateImplCopyWith<$Res>
    implements $TasksStateCopyWith<$Res> {
  factory _$$TasksStateImplCopyWith(
          _$TasksStateImpl value, $Res Function(_$TasksStateImpl) then) =
      __$$TasksStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Task>? tasks,
      List<AppFlowyGroupData>? groups,
      String? errorMessage,
      PageStateStatus status});
}

/// @nodoc
class __$$TasksStateImplCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$TasksStateImpl>
    implements _$$TasksStateImplCopyWith<$Res> {
  __$$TasksStateImplCopyWithImpl(
      _$TasksStateImpl _value, $Res Function(_$TasksStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = freezed,
    Object? groups = freezed,
    Object? errorMessage = freezed,
    Object? status = null,
  }) {
    return _then(_$TasksStateImpl(
      tasks: freezed == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      groups: freezed == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<AppFlowyGroupData>?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PageStateStatus,
    ));
  }
}

/// @nodoc

class _$TasksStateImpl implements _TasksState {
  const _$TasksStateImpl(
      {final List<Task>? tasks,
      final List<AppFlowyGroupData>? groups,
      this.errorMessage,
      required this.status})
      : _tasks = tasks,
        _groups = groups;

  final List<Task>? _tasks;
  @override
  List<Task>? get tasks {
    final value = _tasks;
    if (value == null) return null;
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AppFlowyGroupData>? _groups;
  @override
  List<AppFlowyGroupData>? get groups {
    final value = _groups;
    if (value == null) return null;
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? errorMessage;
  @override
  final PageStateStatus status;

  @override
  String toString() {
    return 'TasksState(tasks: $tasks, groups: $groups, errorMessage: $errorMessage, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksStateImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_groups),
      errorMessage,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksStateImplCopyWith<_$TasksStateImpl> get copyWith =>
      __$$TasksStateImplCopyWithImpl<_$TasksStateImpl>(this, _$identity);
}

abstract class _TasksState implements TasksState {
  const factory _TasksState(
      {final List<Task>? tasks,
      final List<AppFlowyGroupData>? groups,
      final String? errorMessage,
      required final PageStateStatus status}) = _$TasksStateImpl;

  @override
  List<Task>? get tasks;
  @override
  List<AppFlowyGroupData>? get groups;
  @override
  String? get errorMessage;
  @override
  PageStateStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$TasksStateImplCopyWith<_$TasksStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
