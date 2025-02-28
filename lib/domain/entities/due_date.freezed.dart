// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'due_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DueDate {
  String get date => throw _privateConstructorUsedError;
  String get string => throw _privateConstructorUsedError;
  String get lang => throw _privateConstructorUsedError;
  bool get isRecurring => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DueDateCopyWith<DueDate> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DueDateCopyWith<$Res> {
  factory $DueDateCopyWith(DueDate value, $Res Function(DueDate) then) =
      _$DueDateCopyWithImpl<$Res, DueDate>;
  @useResult
  $Res call({String date, String string, String lang, bool isRecurring});
}

/// @nodoc
class _$DueDateCopyWithImpl<$Res, $Val extends DueDate>
    implements $DueDateCopyWith<$Res> {
  _$DueDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? string = null,
    Object? lang = null,
    Object? isRecurring = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      string: null == string
          ? _value.string
          : string // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      isRecurring: null == isRecurring
          ? _value.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DueDateImplCopyWith<$Res> implements $DueDateCopyWith<$Res> {
  factory _$$DueDateImplCopyWith(
          _$DueDateImpl value, $Res Function(_$DueDateImpl) then) =
      __$$DueDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, String string, String lang, bool isRecurring});
}

/// @nodoc
class __$$DueDateImplCopyWithImpl<$Res>
    extends _$DueDateCopyWithImpl<$Res, _$DueDateImpl>
    implements _$$DueDateImplCopyWith<$Res> {
  __$$DueDateImplCopyWithImpl(
      _$DueDateImpl _value, $Res Function(_$DueDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? string = null,
    Object? lang = null,
    Object? isRecurring = null,
  }) {
    return _then(_$DueDateImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      string: null == string
          ? _value.string
          : string // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      isRecurring: null == isRecurring
          ? _value.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DueDateImpl implements _DueDate {
  _$DueDateImpl(
      {required this.date,
      required this.string,
      required this.lang,
      required this.isRecurring});

  @override
  final String date;
  @override
  final String string;
  @override
  final String lang;
  @override
  final bool isRecurring;

  @override
  String toString() {
    return 'DueDate(date: $date, string: $string, lang: $lang, isRecurring: $isRecurring)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DueDateImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.string, string) || other.string == string) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.isRecurring, isRecurring) ||
                other.isRecurring == isRecurring));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, string, lang, isRecurring);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DueDateImplCopyWith<_$DueDateImpl> get copyWith =>
      __$$DueDateImplCopyWithImpl<_$DueDateImpl>(this, _$identity);
}

abstract class _DueDate implements DueDate {
  factory _DueDate(
      {required final String date,
      required final String string,
      required final String lang,
      required final bool isRecurring}) = _$DueDateImpl;

  @override
  String get date;
  @override
  String get string;
  @override
  String get lang;
  @override
  bool get isRecurring;
  @override
  @JsonKey(ignore: true)
  _$$DueDateImplCopyWith<_$DueDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
