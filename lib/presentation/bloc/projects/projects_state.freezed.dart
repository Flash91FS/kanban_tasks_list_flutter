// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projects_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProjectsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Project> allItems) loaded,
    required TResult Function() loading,
    required TResult Function() failedToLoad,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Project> allItems)? loaded,
    TResult? Function()? loading,
    TResult? Function()? failedToLoad,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Project> allItems)? loaded,
    TResult Function()? loading,
    TResult Function()? failedToLoad,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data value) loaded,
    required TResult Function(Loading value) loading,
    required TResult Function(FailedToLoad value) failedToLoad,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Data value)? loaded,
    TResult? Function(Loading value)? loading,
    TResult? Function(FailedToLoad value)? failedToLoad,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data value)? loaded,
    TResult Function(Loading value)? loading,
    TResult Function(FailedToLoad value)? failedToLoad,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectsStateCopyWith<$Res> {
  factory $ProjectsStateCopyWith(
          ProjectsState value, $Res Function(ProjectsState) then) =
      _$ProjectsStateCopyWithImpl<$Res, ProjectsState>;
}

/// @nodoc
class _$ProjectsStateCopyWithImpl<$Res, $Val extends ProjectsState>
    implements $ProjectsStateCopyWith<$Res> {
  _$ProjectsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Project> allItems});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$ProjectsStateCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allItems = null,
  }) {
    return _then(_$DataImpl(
      allItems: null == allItems
          ? _value._allItems
          : allItems // ignore: cast_nullable_to_non_nullable
              as List<Project>,
    ));
  }
}

/// @nodoc

class _$DataImpl implements Data {
  const _$DataImpl({required final List<Project> allItems})
      : _allItems = allItems;

  final List<Project> _allItems;
  @override
  List<Project> get allItems {
    if (_allItems is EqualUnmodifiableListView) return _allItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allItems);
  }

  @override
  String toString() {
    return 'ProjectsState.loaded(allItems: $allItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            const DeepCollectionEquality().equals(other._allItems, _allItems));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_allItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Project> allItems) loaded,
    required TResult Function() loading,
    required TResult Function() failedToLoad,
  }) {
    return loaded(allItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Project> allItems)? loaded,
    TResult? Function()? loading,
    TResult? Function()? failedToLoad,
  }) {
    return loaded?.call(allItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Project> allItems)? loaded,
    TResult Function()? loading,
    TResult Function()? failedToLoad,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(allItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data value) loaded,
    required TResult Function(Loading value) loading,
    required TResult Function(FailedToLoad value) failedToLoad,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Data value)? loaded,
    TResult? Function(Loading value)? loading,
    TResult? Function(FailedToLoad value)? failedToLoad,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data value)? loaded,
    TResult Function(Loading value)? loading,
    TResult Function(FailedToLoad value)? failedToLoad,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Data implements ProjectsState {
  const factory Data({required final List<Project> allItems}) = _$DataImpl;

  List<Project> get allItems;
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ProjectsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ProjectsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Project> allItems) loaded,
    required TResult Function() loading,
    required TResult Function() failedToLoad,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Project> allItems)? loaded,
    TResult? Function()? loading,
    TResult? Function()? failedToLoad,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Project> allItems)? loaded,
    TResult Function()? loading,
    TResult Function()? failedToLoad,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data value) loaded,
    required TResult Function(Loading value) loading,
    required TResult Function(FailedToLoad value) failedToLoad,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Data value)? loaded,
    TResult? Function(Loading value)? loading,
    TResult? Function(FailedToLoad value)? failedToLoad,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data value)? loaded,
    TResult Function(Loading value)? loading,
    TResult Function(FailedToLoad value)? failedToLoad,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ProjectsState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$FailedToLoadImplCopyWith<$Res> {
  factory _$$FailedToLoadImplCopyWith(
          _$FailedToLoadImpl value, $Res Function(_$FailedToLoadImpl) then) =
      __$$FailedToLoadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FailedToLoadImplCopyWithImpl<$Res>
    extends _$ProjectsStateCopyWithImpl<$Res, _$FailedToLoadImpl>
    implements _$$FailedToLoadImplCopyWith<$Res> {
  __$$FailedToLoadImplCopyWithImpl(
      _$FailedToLoadImpl _value, $Res Function(_$FailedToLoadImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FailedToLoadImpl implements FailedToLoad {
  const _$FailedToLoadImpl();

  @override
  String toString() {
    return 'ProjectsState.failedToLoad()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FailedToLoadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Project> allItems) loaded,
    required TResult Function() loading,
    required TResult Function() failedToLoad,
  }) {
    return failedToLoad();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Project> allItems)? loaded,
    TResult? Function()? loading,
    TResult? Function()? failedToLoad,
  }) {
    return failedToLoad?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Project> allItems)? loaded,
    TResult Function()? loading,
    TResult Function()? failedToLoad,
    required TResult orElse(),
  }) {
    if (failedToLoad != null) {
      return failedToLoad();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data value) loaded,
    required TResult Function(Loading value) loading,
    required TResult Function(FailedToLoad value) failedToLoad,
  }) {
    return failedToLoad(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Data value)? loaded,
    TResult? Function(Loading value)? loading,
    TResult? Function(FailedToLoad value)? failedToLoad,
  }) {
    return failedToLoad?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data value)? loaded,
    TResult Function(Loading value)? loading,
    TResult Function(FailedToLoad value)? failedToLoad,
    required TResult orElse(),
  }) {
    if (failedToLoad != null) {
      return failedToLoad(this);
    }
    return orElse();
  }
}

abstract class FailedToLoad implements ProjectsState {
  const factory FailedToLoad() = _$FailedToLoadImpl;
}
