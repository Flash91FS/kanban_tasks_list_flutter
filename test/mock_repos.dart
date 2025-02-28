import 'package:kanban_tasks_list_flutter/domain/irepositories/i_comments_repository.dart';
import 'package:kanban_tasks_list_flutter/domain/irepositories/i_firebase_repository.dart';
import 'package:kanban_tasks_list_flutter/domain/irepositories/i_projects_repository.dart';
import 'package:kanban_tasks_list_flutter/domain/irepositories/i_sections_repository.dart';
import 'package:kanban_tasks_list_flutter/domain/irepositories/i_tasks_repository.dart';
import 'package:mocktail/mocktail.dart';


class MockProjectsRepository extends Mock implements IProjectsRepository {}

class MockSectionsRepository extends Mock implements ISectionsRepository {}

class MockCommentsRepository extends Mock implements ICommentsRepository {}


class MockTasksRepository extends Mock implements ITasksRepository {}

class MockFirebaseRepository extends Mock implements IFirebaseRepository {}