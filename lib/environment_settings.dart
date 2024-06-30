class EnvironmentSettings {
  EnvironmentSettings(Map<String, String> environmentMap)
      :
        baseApiUrl = environmentMap['BASE_API_URL'] ?? '',
        apiToken = environmentMap['API_TOKEN'] ?? '',
        projectId = environmentMap['PROJECT_ID'] ?? '',
        sectionIdToDo = environmentMap['SECTION_ID_TODO'] ?? '',
        sectionIdInProgress = environmentMap['SECTION_ID_IN_PROGRESS'] ?? '',
        sectionIdDone = environmentMap['SECTION_ID_DONE'] ?? '';

  final String baseApiUrl;
  final String apiToken;
  final String projectId;
  final String sectionIdToDo;
  final String sectionIdInProgress;
  final String sectionIdDone;
}
