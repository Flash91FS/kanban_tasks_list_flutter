import 'package:appflowy_board/appflowy_board.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kanban_tasks_list_flutter/data/api_client.dart';
import 'package:kanban_tasks_list_flutter/data/apis/sections_api.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/comment.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/kanban_item_data_model.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/project.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/section.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/task.dart';
import 'package:mocktail/mocktail.dart';



class MockApiClient extends Mock implements ApiClient {}
class MockSectionsApi extends Mock implements SectionsApi {}

final mockTaskId = '2995104339';
final mockBaseUrl = 'https://todoist.com/';
final mockApiToken = '123456';
final mockProjectId = '2203306141';
final mockSectionIdToDo = 'sectionIdToDo';
final mockSectionIdInProgress = 'sectionIdInProgress';
final mockSectionIdDone = 'sectionIdDone';
final mockDateTime = DateTime.parse("2016-09-22T07:00:00.000000Z");
final mockTimestamp = Timestamp.fromDate(mockDateTime);

final mockComment = Comment(
  id: '1',
  content: 'some.content',
  postedAt: mockDateTime,
  projectId: '2203306141',
  taskId: '2995104339',
  attachment: null,
);

final mockProject = Project(
  id: '2203306141',
  name: "Shopping List",
  commentCount: 10,
  order: 1,
  color: "charcoal",
  isShared: false,
  isFavorite: false,
  isInboxProject: false,
  isTeamInbox: false,
  viewStyle: "list",
  parentId: null,
  url: 'https://todoist.com/showProject?id=2203306141',
);

final mockSectionToDo = Section(
  id: mockSectionIdToDo,
  projectId: "2203306141",
  order: 1,
  name: "Groceries",
);

final mockSectionInProgress = Section(
  id: mockSectionIdInProgress,
  projectId: "2203306141",
  order: 1,
  name: "Groceries",
);

final mockSectionDone = Section(
  id: mockSectionIdDone,
  projectId: "2203306141",
  order: 1,
  name: "Groceries",
);

final mockTask = Task(
  id: '2995104339',
  content: 'Buy Milk',
  description: 'some description',
  commentCount: 0,
  isCompleted: false,
  order: 1,
  priority: 1,
  projectId: '2203306141',
  labels: ['1'],
  due: null,
  sectionId: mockSectionIdToDo,
  parentId: '2995104589',
  creatorId: '2671355',
  createdAt: mockDateTime,
  assigneeId: "2671362",
  assignerId: "2671355",
  url: 'https://todoist.com/showTask?id=2995104339',
);

final mockTask2 = Task(
  id: '2995104340',
  content: 'Buy Milk 2',
  description: 'some description 2',
  commentCount: 0,
  isCompleted: false,
  order: 2,
  priority: 2,
  projectId: '2203306141',
  labels: ['2'],
  due: null,
  sectionId: mockSectionIdToDo,
  parentId: '2995104589',
  creatorId: '2671355',
  createdAt: mockDateTime,
  assigneeId: "2671362",
  assignerId: "2671355",
  url: 'https://todoist.com/showTask?id=2995104340',
);

final mockTask3 = Task(
  id: '2995104343',
  content: 'Buy Milk Progress',
  description: 'some description 3',
  commentCount: 0,
  isCompleted: false,
  order: 3,
  priority: 3,
  projectId: '2203306141',
  labels: ['3'],
  due: null,
  sectionId: mockSectionIdInProgress,
  parentId: '2995104589',
  creatorId: '2671355',
  createdAt: mockDateTime,
  assigneeId: "2671362",
  assignerId: "2671355",
  url: 'https://todoist.com/showTask?id=2995104340',
);

final mockTask4 = Task(
  id: '2995104344',
  content: 'Buy Milk Done',
  description: 'some description 4',
  commentCount: 0,
  isCompleted: false,
  order: 3,
  priority: 3,
  projectId: '2203306141',
  labels: ['3'],
  due: null,
  sectionId: mockSectionIdDone,
  parentId: '2995104589',
  creatorId: '2671355',
  createdAt: mockDateTime,
  assigneeId: "2671362",
  assignerId: "2671355",
  url: 'https://todoist.com/showTask?id=2995104340',
);

final Map<String, dynamic> mockFirebaseData = {
  "taskId": mockTaskId,
  "timeSpentMs": 0,
  "startTimeMs": 0,
  "endTimeMs": 0,
  "timeTrackingStarted": false,
  "updatedAt": mockTimestamp,
};

final mockKanbanItemDataModel = KanbanItemDataModel(
  groupId: mockTask.sectionId!,
  itemId: mockTask.id,
  title: mockTask.content,
  description: mockTask.description,
  startDate: mockTask.createdAt,
  commentCount: mockTask.commentCount,
);

final List<KanbanItemDataModel> mockGroupItemsTodo = [mockKanbanItemDataModel];
final List<KanbanItemDataModel> mockGroupItemsInProgress = [];
final List<KanbanItemDataModel> mockGroupItemsDone = [];

final mockGroupTodo = AppFlowyGroupData(
  id: mockSectionIdToDo,
  name: 'To Do',
  items: List<AppFlowyGroupItem>.from(mockGroupItemsTodo),
);
final mockGroupInProgress = AppFlowyGroupData(
  id: mockSectionIdInProgress,
  name: 'In Progress',
  items: List<AppFlowyGroupItem>.from(mockGroupItemsInProgress),
);
final mockGroupDone = AppFlowyGroupData(
  id: mockSectionIdDone,
  name: 'Done',
  items: List<AppFlowyGroupItem>.from(mockGroupItemsDone),
);

final mockGroupsList = [mockGroupTodo, mockGroupInProgress, mockGroupDone];