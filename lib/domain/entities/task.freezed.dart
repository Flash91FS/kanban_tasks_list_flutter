// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get commentCount => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  int get priority => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  List<String> get labels => throw _privateConstructorUsedError;
  DueDate? get due => throw _privateConstructorUsedError;
  String? get sectionId => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get assigneeId => throw _privateConstructorUsedError;
  String? get assignerId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String id,
      String content,
      String description,
      int commentCount,
      bool isCompleted,
      int order,
      int priority,
      String projectId,
      List<String> labels,
      DueDate? due,
      String? sectionId,
      String? parentId,
      String creatorId,
      DateTime createdAt,
      String? assigneeId,
      String? assignerId,
      String url});

  $DueDateCopyWith<$Res>? get due;
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? description = null,
    Object? commentCount = null,
    Object? isCompleted = null,
    Object? order = null,
    Object? priority = null,
    Object? projectId = null,
    Object? labels = null,
    Object? due = freezed,
    Object? sectionId = freezed,
    Object? parentId = freezed,
    Object? creatorId = null,
    Object? createdAt = null,
    Object? assigneeId = freezed,
    Object? assignerId = freezed,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      labels: null == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      due: freezed == due
          ? _value.due
          : due // ignore: cast_nullable_to_non_nullable
              as DueDate?,
      sectionId: freezed == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assigneeId: freezed == assigneeId
          ? _value.assigneeId
          : assigneeId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignerId: freezed == assignerId
          ? _value.assignerId
          : assignerId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DueDateCopyWith<$Res>? get due {
    if (_value.due == null) {
      return null;
    }

    return $DueDateCopyWith<$Res>(_value.due!, (value) {
      return _then(_value.copyWith(due: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      String description,
      int commentCount,
      bool isCompleted,
      int order,
      int priority,
      String projectId,
      List<String> labels,
      DueDate? due,
      String? sectionId,
      String? parentId,
      String creatorId,
      DateTime createdAt,
      String? assigneeId,
      String? assignerId,
      String url});

  @override
  $DueDateCopyWith<$Res>? get due;
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? description = null,
    Object? commentCount = null,
    Object? isCompleted = null,
    Object? order = null,
    Object? priority = null,
    Object? projectId = null,
    Object? labels = null,
    Object? due = freezed,
    Object? sectionId = freezed,
    Object? parentId = freezed,
    Object? creatorId = null,
    Object? createdAt = null,
    Object? assigneeId = freezed,
    Object? assignerId = freezed,
    Object? url = null,
  }) {
    return _then(_$TaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      labels: null == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      due: freezed == due
          ? _value.due
          : due // ignore: cast_nullable_to_non_nullable
              as DueDate?,
      sectionId: freezed == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assigneeId: freezed == assigneeId
          ? _value.assigneeId
          : assigneeId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignerId: freezed == assignerId
          ? _value.assignerId
          : assignerId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TaskImpl implements _Task {
  _$TaskImpl(
      {required this.id,
      required this.content,
      required this.description,
      required this.commentCount,
      required this.isCompleted,
      required this.order,
      required this.priority,
      required this.projectId,
      required final List<String> labels,
      this.due,
      this.sectionId,
      this.parentId,
      required this.creatorId,
      required this.createdAt,
      this.assigneeId,
      this.assignerId,
      required this.url})
      : _labels = labels;

  @override
  final String id;
  @override
  final String content;
  @override
  final String description;
  @override
  final int commentCount;
  @override
  final bool isCompleted;
  @override
  final int order;
  @override
  final int priority;
  @override
  final String projectId;
  final List<String> _labels;
  @override
  List<String> get labels {
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labels);
  }

  @override
  final DueDate? due;
  @override
  final String? sectionId;
  @override
  final String? parentId;
  @override
  final String creatorId;
  @override
  final DateTime createdAt;
  @override
  final String? assigneeId;
  @override
  final String? assignerId;
  @override
  final String url;

  @override
  String toString() {
    return 'Task(id: $id, content: $content, description: $description, commentCount: $commentCount, isCompleted: $isCompleted, order: $order, priority: $priority, projectId: $projectId, labels: $labels, due: $due, sectionId: $sectionId, parentId: $parentId, creatorId: $creatorId, createdAt: $createdAt, assigneeId: $assigneeId, assignerId: $assignerId, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            (identical(other.due, due) || other.due == due) &&
            (identical(other.sectionId, sectionId) ||
                other.sectionId == sectionId) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.assigneeId, assigneeId) ||
                other.assigneeId == assigneeId) &&
            (identical(other.assignerId, assignerId) ||
                other.assignerId == assignerId) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      content,
      description,
      commentCount,
      isCompleted,
      order,
      priority,
      projectId,
      const DeepCollectionEquality().hash(_labels),
      due,
      sectionId,
      parentId,
      creatorId,
      createdAt,
      assigneeId,
      assignerId,
      url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);
}

abstract class _Task implements Task {
  factory _Task(
      {required final String id,
      required final String content,
      required final String description,
      required final int commentCount,
      required final bool isCompleted,
      required final int order,
      required final int priority,
      required final String projectId,
      required final List<String> labels,
      final DueDate? due,
      final String? sectionId,
      final String? parentId,
      required final String creatorId,
      required final DateTime createdAt,
      final String? assigneeId,
      final String? assignerId,
      required final String url}) = _$TaskImpl;

  @override
  String get id;
  @override
  String get content;
  @override
  String get description;
  @override
  int get commentCount;
  @override
  bool get isCompleted;
  @override
  int get order;
  @override
  int get priority;
  @override
  String get projectId;
  @override
  List<String> get labels;
  @override
  DueDate? get due;
  @override
  String? get sectionId;
  @override
  String? get parentId;
  @override
  String get creatorId;
  @override
  DateTime get createdAt;
  @override
  String? get assigneeId;
  @override
  String? get assignerId;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
