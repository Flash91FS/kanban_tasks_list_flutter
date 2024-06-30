part of 'environment_cubit.dart';

@freezed
class EnvironmentState with _$EnvironmentState {
  const factory EnvironmentState(
      {required String baseApiUrl,
      required String apiToken,
      required String projectId,
      required String sectionIdToDo,
      required String sectionIdInProgress,
      required String sectionIdDone}) = _EnvironmentState;
}
