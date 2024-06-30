// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kanban_board_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$KanbanBoardState {
  List<AppFlowyGroupData>? get groups => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KanbanBoardStateCopyWith<KanbanBoardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KanbanBoardStateCopyWith<$Res> {
  factory $KanbanBoardStateCopyWith(
          KanbanBoardState value, $Res Function(KanbanBoardState) then) =
      _$KanbanBoardStateCopyWithImpl<$Res, KanbanBoardState>;
  @useResult
  $Res call({List<AppFlowyGroupData>? groups});
}

/// @nodoc
class _$KanbanBoardStateCopyWithImpl<$Res, $Val extends KanbanBoardState>
    implements $KanbanBoardStateCopyWith<$Res> {
  _$KanbanBoardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups = freezed,
  }) {
    return _then(_value.copyWith(
      groups: freezed == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<AppFlowyGroupData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KanbanBoardStateImplCopyWith<$Res>
    implements $KanbanBoardStateCopyWith<$Res> {
  factory _$$KanbanBoardStateImplCopyWith(_$KanbanBoardStateImpl value,
          $Res Function(_$KanbanBoardStateImpl) then) =
      __$$KanbanBoardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AppFlowyGroupData>? groups});
}

/// @nodoc
class __$$KanbanBoardStateImplCopyWithImpl<$Res>
    extends _$KanbanBoardStateCopyWithImpl<$Res, _$KanbanBoardStateImpl>
    implements _$$KanbanBoardStateImplCopyWith<$Res> {
  __$$KanbanBoardStateImplCopyWithImpl(_$KanbanBoardStateImpl _value,
      $Res Function(_$KanbanBoardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups = freezed,
  }) {
    return _then(_$KanbanBoardStateImpl(
      groups: freezed == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<AppFlowyGroupData>?,
    ));
  }
}

/// @nodoc

class _$KanbanBoardStateImpl implements _KanbanBoardState {
  const _$KanbanBoardStateImpl({final List<AppFlowyGroupData>? groups})
      : _groups = groups;

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
  String toString() {
    return 'KanbanBoardState(groups: $groups)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KanbanBoardStateImpl &&
            const DeepCollectionEquality().equals(other._groups, _groups));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_groups));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KanbanBoardStateImplCopyWith<_$KanbanBoardStateImpl> get copyWith =>
      __$$KanbanBoardStateImplCopyWithImpl<_$KanbanBoardStateImpl>(
          this, _$identity);
}

abstract class _KanbanBoardState implements KanbanBoardState {
  const factory _KanbanBoardState({final List<AppFlowyGroupData>? groups}) =
      _$KanbanBoardStateImpl;

  @override
  List<AppFlowyGroupData>? get groups;
  @override
  @JsonKey(ignore: true)
  _$$KanbanBoardStateImplCopyWith<_$KanbanBoardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
