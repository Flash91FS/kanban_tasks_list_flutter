import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kanban_tasks_list_flutter/api_client/kanban_api_client.dart';
import 'package:kanban_tasks_list_flutter/app.dart';
import 'package:kanban_tasks_list_flutter/environment_settings.dart';

void main() async {
  await dotenv.load(fileName: 'dev.env');
  final envSettings = EnvironmentSettings(dotenv.env);
  final apiClient = KanbanApiClient.withHttpDefaults(envSettings.baseApiUrl, envSettings.apiToken);
  runApp(App(apiClient: apiClient, pageTitle: 'Kanban App'));
}
