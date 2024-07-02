import 'package:kanban_tasks_list_flutter/repository/comments_repository.dart';
import 'package:kanban_tasks_list_flutter/repository/firebase_repository.dart';
import 'package:kanban_tasks_list_flutter/repository/projects_repository.dart';
import 'package:kanban_tasks_list_flutter/repository/sections_repository.dart';
import 'package:kanban_tasks_list_flutter/repository/tasks_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockTasksRepository extends Mock implements TasksRepository {}

class MockProjectsRepository extends Mock implements ProjectsRepository {}

class MockSectionsRepository extends Mock implements SectionsRepository {}

class MockCommentsRepository extends Mock implements CommentsRepository {}

class MockFirebaseRepository extends Mock implements FirebaseRepository {}