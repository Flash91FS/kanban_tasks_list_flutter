// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kanban_task_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$KanbanTaskState {
  PageStateStatus get status => throw _privateConstructorUsedError;
  String? get taskId => throw _privateConstructorUsedError;
  String? get timeDurationToDisplay => throw _privateConstructorUsedError;
  int get timeSpentMs => throw _privateConstructorUsedError;
  int get startTimeMs => throw _privateConstructorUsedError;
  int get endTimeMs => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool get timeTrackingStarted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KanbanTaskStateCopyWith<KanbanTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KanbanTaskStateCopyWith<$Res> {
  factory $KanbanTaskStateCopyWith(
          KanbanTaskState value, $Res Function(KanbanTaskState) then) =
      _$KanbanTaskStateCopyWithImpl<$Res, KanbanTaskState>;
  @useResult
  $Res call(
      {PageStateStatus status,
      String? taskId,
      String? timeDurationToDisplay,
      int timeSpentMs,
      int startTimeMs,
      int endTimeMs,
      DateTime? updatedAt,
      bool timeTrackingStarted});
}

/// @nodoc
class _$KanbanTaskStateCopyWithImpl<$Res, $Val extends KanbanTaskState>
    implements $KanbanTaskStateCopyWith<$Res> {
  _$KanbanTaskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? taskId = freezed,
    Object? timeDurationToDisplay = freezed,
    Object? timeSpentMs = null,
    Object? startTimeMs = null,
    Object? endTimeMs = null,
    Object? updatedAt = freezed,
    Object? timeTrackingStarted = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PageStateStatus,
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      timeDurationToDisplay: freezed == timeDurationToDisplay
          ? _value.timeDurationToDisplay
          : timeDurationToDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
      timeSpentMs: null == timeSpentMs
          ? _value.timeSpentMs
          : timeSpentMs // ignore: cast_nullable_to_non_nullable
              as int,
      startTimeMs: null == startTimeMs
          ? _value.startTimeMs
          : startTimeMs // ignore: cast_nullable_to_non_nullable
              as int,
      endTimeMs: null == endTimeMs
          ? _value.endTimeMs
          : endTimeMs // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeTrackingStarted: null == timeTrackingStarted
          ? _value.timeTrackingStarted
          : timeTrackingStarted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KanbanTaskStateImplCopyWith<$Res>
    implements $KanbanTaskStateCopyWith<$Res> {
  factory _$$KanbanTaskStateImplCopyWith(_$KanbanTaskStateImpl value,
          $Res Function(_$KanbanTaskStateImpl) then) =
      __$$KanbanTaskStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PageStateStatus status,
      String? taskId,
      String? timeDurationToDisplay,
      int timeSpentMs,
      int startTimeMs,
      int endTimeMs,
      DateTime? updatedAt,
      bool timeTrackingStarted});
}

/// @nodoc
class __$$KanbanTaskStateImplCopyWithImpl<$Res>
    extends _$KanbanTaskStateCopyWithImpl<$Res, _$KanbanTaskStateImpl>
    implements _$$KanbanTaskStateImplCopyWith<$Res> {
  __$$KanbanTaskStateImplCopyWithImpl(
      _$KanbanTaskStateImpl _value, $Res Function(_$KanbanTaskStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? taskId = freezed,
    Object? timeDurationToDisplay = freezed,
    Object? timeSpentMs = null,
    Object? startTimeMs = null,
    Object? endTimeMs = null,
    Object? updatedAt = freezed,
    Object? timeTrackingStarted = null,
  }) {
    return _then(_$KanbanTaskStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PageStateStatus,
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      timeDurationToDisplay: freezed == timeDurationToDisplay
          ? _value.timeDurationToDisplay
          : timeDurationToDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
      timeSpentMs: null == timeSpentMs
          ? _value.timeSpentMs
          : timeSpentMs // ignore: cast_nullable_to_non_nullable
              as int,
      startTimeMs: null == startTimeMs
          ? _value.startTimeMs
          : startTimeMs // ignore: cast_nullable_to_non_nullable
              as int,
      endTimeMs: null == endTimeMs
          ? _value.endTimeMs
          : endTimeMs // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeTrackingStarted: null == timeTrackingStarted
          ? _value.timeTrackingStarted
          : timeTrackingStarted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$KanbanTaskStateImpl implements _KanbanTaskState {
  const _$KanbanTaskStateImpl(
      {required this.status,
      this.taskId,
      this.timeDurationToDisplay,
      this.timeSpentMs = 0,
      this.startTimeMs = 0,
      this.endTimeMs = 0,
      this.updatedAt,
      this.timeTrackingStarted = false});

  @override
  final PageStateStatus status;
  @override
  final String? taskId;
  @override
  final String? timeDurationToDisplay;
  @override
  @JsonKey()
  final int timeSpentMs;
  @override
  @JsonKey()
  final int startTimeMs;
  @override
  @JsonKey()
  final int endTimeMs;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final bool timeTrackingStarted;

  @override
  String toString() {
    return 'KanbanTaskState(status: $status, taskId: $taskId, timeDurationToDisplay: $timeDurationToDisplay, timeSpentMs: $timeSpentMs, startTimeMs: $startTimeMs, endTimeMs: $endTimeMs, updatedAt: $updatedAt, timeTrackingStarted: $timeTrackingStarted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KanbanTaskStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.timeDurationToDisplay, timeDurationToDisplay) ||
                other.timeDurationToDisplay == timeDurationToDisplay) &&
            (identical(other.timeSpentMs, timeSpentMs) ||
                other.timeSpentMs == timeSpentMs) &&
            (identical(other.startTimeMs, startTimeMs) ||
                other.startTimeMs == startTimeMs) &&
            (identical(other.endTimeMs, endTimeMs) ||
                other.endTimeMs == endTimeMs) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.timeTrackingStarted, timeTrackingStarted) ||
                other.timeTrackingStarted == timeTrackingStarted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      taskId,
      timeDurationToDisplay,
      timeSpentMs,
      startTimeMs,
      endTimeMs,
      updatedAt,
      timeTrackingStarted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KanbanTaskStateImplCopyWith<_$KanbanTaskStateImpl> get copyWith =>
      __$$KanbanTaskStateImplCopyWithImpl<_$KanbanTaskStateImpl>(
          this, _$identity);
}

abstract class _KanbanTaskState implements KanbanTaskState {
  const factory _KanbanTaskState(
      {required final PageStateStatus status,
      final String? taskId,
      final String? timeDurationToDisplay,
      final int timeSpentMs,
      final int startTimeMs,
      final int endTimeMs,
      final DateTime? updatedAt,
      final bool timeTrackingStarted}) = _$KanbanTaskStateImpl;

  @override
  PageStateStatus get status;
  @override
  String? get taskId;
  @override
  String? get timeDurationToDisplay;
  @override
  int get timeSpentMs;
  @override
  int get startTimeMs;
  @override
  int get endTimeMs;
  @override
  DateTime? get updatedAt;
  @override
  bool get timeTrackingStarted;
  @override
  @JsonKey(ignore: true)
  _$$KanbanTaskStateImplCopyWith<_$KanbanTaskStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
