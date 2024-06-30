// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'environment_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EnvironmentState {
  String get baseApiUrl => throw _privateConstructorUsedError;
  String get apiToken => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get sectionIdToDo => throw _privateConstructorUsedError;
  String get sectionIdInProgress => throw _privateConstructorUsedError;
  String get sectionIdDone => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EnvironmentStateCopyWith<EnvironmentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnvironmentStateCopyWith<$Res> {
  factory $EnvironmentStateCopyWith(
          EnvironmentState value, $Res Function(EnvironmentState) then) =
      _$EnvironmentStateCopyWithImpl<$Res, EnvironmentState>;
  @useResult
  $Res call(
      {String baseApiUrl,
      String apiToken,
      String projectId,
      String sectionIdToDo,
      String sectionIdInProgress,
      String sectionIdDone});
}

/// @nodoc
class _$EnvironmentStateCopyWithImpl<$Res, $Val extends EnvironmentState>
    implements $EnvironmentStateCopyWith<$Res> {
  _$EnvironmentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseApiUrl = null,
    Object? apiToken = null,
    Object? projectId = null,
    Object? sectionIdToDo = null,
    Object? sectionIdInProgress = null,
    Object? sectionIdDone = null,
  }) {
    return _then(_value.copyWith(
      baseApiUrl: null == baseApiUrl
          ? _value.baseApiUrl
          : baseApiUrl // ignore: cast_nullable_to_non_nullable
              as String,
      apiToken: null == apiToken
          ? _value.apiToken
          : apiToken // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      sectionIdToDo: null == sectionIdToDo
          ? _value.sectionIdToDo
          : sectionIdToDo // ignore: cast_nullable_to_non_nullable
              as String,
      sectionIdInProgress: null == sectionIdInProgress
          ? _value.sectionIdInProgress
          : sectionIdInProgress // ignore: cast_nullable_to_non_nullable
              as String,
      sectionIdDone: null == sectionIdDone
          ? _value.sectionIdDone
          : sectionIdDone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnvironmentStateImplCopyWith<$Res>
    implements $EnvironmentStateCopyWith<$Res> {
  factory _$$EnvironmentStateImplCopyWith(_$EnvironmentStateImpl value,
          $Res Function(_$EnvironmentStateImpl) then) =
      __$$EnvironmentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String baseApiUrl,
      String apiToken,
      String projectId,
      String sectionIdToDo,
      String sectionIdInProgress,
      String sectionIdDone});
}

/// @nodoc
class __$$EnvironmentStateImplCopyWithImpl<$Res>
    extends _$EnvironmentStateCopyWithImpl<$Res, _$EnvironmentStateImpl>
    implements _$$EnvironmentStateImplCopyWith<$Res> {
  __$$EnvironmentStateImplCopyWithImpl(_$EnvironmentStateImpl _value,
      $Res Function(_$EnvironmentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseApiUrl = null,
    Object? apiToken = null,
    Object? projectId = null,
    Object? sectionIdToDo = null,
    Object? sectionIdInProgress = null,
    Object? sectionIdDone = null,
  }) {
    return _then(_$EnvironmentStateImpl(
      baseApiUrl: null == baseApiUrl
          ? _value.baseApiUrl
          : baseApiUrl // ignore: cast_nullable_to_non_nullable
              as String,
      apiToken: null == apiToken
          ? _value.apiToken
          : apiToken // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      sectionIdToDo: null == sectionIdToDo
          ? _value.sectionIdToDo
          : sectionIdToDo // ignore: cast_nullable_to_non_nullable
              as String,
      sectionIdInProgress: null == sectionIdInProgress
          ? _value.sectionIdInProgress
          : sectionIdInProgress // ignore: cast_nullable_to_non_nullable
              as String,
      sectionIdDone: null == sectionIdDone
          ? _value.sectionIdDone
          : sectionIdDone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EnvironmentStateImpl implements _EnvironmentState {
  const _$EnvironmentStateImpl(
      {required this.baseApiUrl,
      required this.apiToken,
      required this.projectId,
      required this.sectionIdToDo,
      required this.sectionIdInProgress,
      required this.sectionIdDone});

  @override
  final String baseApiUrl;
  @override
  final String apiToken;
  @override
  final String projectId;
  @override
  final String sectionIdToDo;
  @override
  final String sectionIdInProgress;
  @override
  final String sectionIdDone;

  @override
  String toString() {
    return 'EnvironmentState(baseApiUrl: $baseApiUrl, apiToken: $apiToken, projectId: $projectId, sectionIdToDo: $sectionIdToDo, sectionIdInProgress: $sectionIdInProgress, sectionIdDone: $sectionIdDone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnvironmentStateImpl &&
            (identical(other.baseApiUrl, baseApiUrl) ||
                other.baseApiUrl == baseApiUrl) &&
            (identical(other.apiToken, apiToken) ||
                other.apiToken == apiToken) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.sectionIdToDo, sectionIdToDo) ||
                other.sectionIdToDo == sectionIdToDo) &&
            (identical(other.sectionIdInProgress, sectionIdInProgress) ||
                other.sectionIdInProgress == sectionIdInProgress) &&
            (identical(other.sectionIdDone, sectionIdDone) ||
                other.sectionIdDone == sectionIdDone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, baseApiUrl, apiToken, projectId,
      sectionIdToDo, sectionIdInProgress, sectionIdDone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnvironmentStateImplCopyWith<_$EnvironmentStateImpl> get copyWith =>
      __$$EnvironmentStateImplCopyWithImpl<_$EnvironmentStateImpl>(
          this, _$identity);
}

abstract class _EnvironmentState implements EnvironmentState {
  const factory _EnvironmentState(
      {required final String baseApiUrl,
      required final String apiToken,
      required final String projectId,
      required final String sectionIdToDo,
      required final String sectionIdInProgress,
      required final String sectionIdDone}) = _$EnvironmentStateImpl;

  @override
  String get baseApiUrl;
  @override
  String get apiToken;
  @override
  String get projectId;
  @override
  String get sectionIdToDo;
  @override
  String get sectionIdInProgress;
  @override
  String get sectionIdDone;
  @override
  @JsonKey(ignore: true)
  _$$EnvironmentStateImplCopyWith<_$EnvironmentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
