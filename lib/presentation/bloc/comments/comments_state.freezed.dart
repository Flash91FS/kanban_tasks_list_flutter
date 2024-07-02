// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommentsState {
  List<Comment>? get comments => throw _privateConstructorUsedError;
  PageStateStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentsStateCopyWith<CommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsStateCopyWith<$Res> {
  factory $CommentsStateCopyWith(
          CommentsState value, $Res Function(CommentsState) then) =
      _$CommentsStateCopyWithImpl<$Res, CommentsState>;
  @useResult
  $Res call(
      {List<Comment>? comments, PageStateStatus status, String? errorMessage});
}

/// @nodoc
class _$CommentsStateCopyWithImpl<$Res, $Val extends CommentsState>
    implements $CommentsStateCopyWith<$Res> {
  _$CommentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PageStateStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentsStateImplCopyWith<$Res>
    implements $CommentsStateCopyWith<$Res> {
  factory _$$CommentsStateImplCopyWith(
          _$CommentsStateImpl value, $Res Function(_$CommentsStateImpl) then) =
      __$$CommentsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Comment>? comments, PageStateStatus status, String? errorMessage});
}

/// @nodoc
class __$$CommentsStateImplCopyWithImpl<$Res>
    extends _$CommentsStateCopyWithImpl<$Res, _$CommentsStateImpl>
    implements _$$CommentsStateImplCopyWith<$Res> {
  __$$CommentsStateImplCopyWithImpl(
      _$CommentsStateImpl _value, $Res Function(_$CommentsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$CommentsStateImpl(
      comments: freezed == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PageStateStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CommentsStateImpl implements _CommentsState {
  const _$CommentsStateImpl(
      {final List<Comment>? comments, required this.status, this.errorMessage})
      : _comments = comments;

  final List<Comment>? _comments;
  @override
  List<Comment>? get comments {
    final value = _comments;
    if (value == null) return null;
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PageStateStatus status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CommentsState(comments: $comments, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsStateImpl &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_comments), status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsStateImplCopyWith<_$CommentsStateImpl> get copyWith =>
      __$$CommentsStateImplCopyWithImpl<_$CommentsStateImpl>(this, _$identity);
}

abstract class _CommentsState implements CommentsState {
  const factory _CommentsState(
      {final List<Comment>? comments,
      required final PageStateStatus status,
      final String? errorMessage}) = _$CommentsStateImpl;

  @override
  List<Comment>? get comments;
  @override
  PageStateStatus get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$CommentsStateImplCopyWith<_$CommentsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
