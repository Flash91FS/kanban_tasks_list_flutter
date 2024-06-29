class EnvironmentSettings {
  EnvironmentSettings(Map<String, String> environmentMap)
      :
        baseApiUrl = environmentMap['BASE_API_URL'] ?? '',
        apiToken = environmentMap['API_TOKEN'] ?? '';

  final String baseApiUrl;
  final String apiToken;
}
