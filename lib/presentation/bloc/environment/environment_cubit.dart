import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'environment_state.dart';

part 'environment_cubit.freezed.dart';

class EnvironmentCubit extends Cubit<EnvironmentState> {
  EnvironmentCubit({
    required String baseApiUrl,
    required String apiToken,
    required String projectId,
    required String sectionIdToDo,
    required String sectionIdInProgress,
    required String sectionIdDone,
  }) : super(EnvironmentState(
          baseApiUrl: baseApiUrl,
          apiToken: apiToken,
          projectId: projectId,
          sectionIdToDo: sectionIdToDo,
          sectionIdInProgress: sectionIdInProgress,
          sectionIdDone: sectionIdDone,
        ));
}
