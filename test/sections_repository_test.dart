import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_tasks_list_flutter/data/api_exception.dart';
import 'package:kanban_tasks_list_flutter/data/api_network_exception.dart';
import 'package:kanban_tasks_list_flutter/data/response_models/error_response.dart';
import 'package:kanban_tasks_list_flutter/data/response_models/section_response_model.dart';
import 'package:kanban_tasks_list_flutter/core/models/exceptions/data_load_exception.dart';
import 'package:kanban_tasks_list_flutter/core/models/exceptions/network_exception.dart';
import 'package:kanban_tasks_list_flutter/core/models/exceptions/unauthorized_exception.dart';
import 'package:kanban_tasks_list_flutter/core/models/exceptions/validation_exception.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/section.dart';
import 'package:kanban_tasks_list_flutter/data/repositories/sections_repository.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_data.dart';

void main() {
  late MockSectionsApi mockSectionsApi;
  late SectionsRepository sectionsRepository;

  setUp(() {
    mockSectionsApi = MockSectionsApi();
    sectionsRepository = SectionsRepository(sectionsApi: mockSectionsApi);
  });

  group('getSectionsList', () {
    test('should return list of sections on successful API call', () async {
      // *** Arrange *** //
      final sectionResponseModels = [
        SectionResponseModel(
            id: '1', projectId: 'p1', name: 'Section 1', order: 0),
        SectionResponseModel(
            id: '2', projectId: 'p1', name: 'Section 2', order: 1),
      ];
      when(() => mockSectionsApi.apiGetSectionsList())
          .thenAnswer((_) async => sectionResponseModels);

      // *** Act *** //
      final result = await sectionsRepository.getSectionsList();

      // *** Assert *** //
      expect(result, isA<Result<List<Section>>>());
      // *** CORRECT ASSERTION FOR SUCCESS ***
      result.when(
        success: (sections) {
          expect(sections,
              isNotNull); // Or any other assertions about the sections
          expect(sections.length, 2);
          expect(sections[0].name, 'Section 1');
        },
        failure: (error) {
          fail(
              'Test failed with error: $error'); // Fail the test if it's a failure
        },
      );
      // *** VERIFY THE CALL ***
      verify(() => mockSectionsApi.apiGetSectionsList()).called(1);
      verifyNoMoreInteractions(mockSectionsApi);
    });

    test('should return empty list when API returns 404', () async {
      // *** Arrange *** //
      final mException = ApiException(
          code: 404,
          errorPayload: const ErrorResponseModel(
              status: 404, title: 'ApiException String'));
      when(() => mockSectionsApi.apiGetSectionsList()).thenThrow(mException);

      // *** Act *** //
      final result = await sectionsRepository.getSectionsList();

      // *** Assert *** //
      expect(result, isA<Result<List<Section>>>());
      // *** CORRECT ASSERTION FOR FAILURE ***
      result.when(
        success: (sections) {
          fail(
              'Test should have failed with a DataLoadException'); // Should not reach here
        },
        failure: (error) {
          expect(error, isA<DataLoadException>()); // Expect a DataLoadException
          expect(
            (error as DataLoadException).message,
            mException.errorPayload?.title,
          ); // Or a more specific message check if you have one.
        },
      );
      // *** VERIFY THE CALL ***
      verify(() => mockSectionsApi.apiGetSectionsList()).called(1);
    });

    test('should return DataLoadException on other API exceptions (e.g., 500)',
        () async {
      // *** Arrange *** //
      final mException = ApiException(
        code: 500,
        errorPayload: const ErrorResponseModel(
          title: 'Internal Server Error',
          status: 500,
        ),
      );
      when(() => mockSectionsApi.apiGetSectionsList())
          .thenThrow(mException); // Throw a 500 exception

      // *** Act *** //
      final result = await sectionsRepository.getSectionsList();

      // *** Assert *** //
      expect(result, isA<Result<List<Section>>>());
      // *** CORRECT ASSERTION FOR FAILURE ***
      result.when(
        success: (sections) {
          fail('Test should have failed with a DataLoadException');
        },
        failure: (error) {
          expect(error, isA<DataLoadException>());
          expect(
            (error as DataLoadException).message,
            mException.errorPayload?.title,
          ); // Or a more specific message check if you have one.
          expect(error.message,
              'Internal Server Error'); // Check the message if possible
        },
      );
      // *** VERIFY THE CALL ***
      verify(() => mockSectionsApi.apiGetSectionsList()).called(1);
    });

    test('should return NetworkException on ApiNetworkException', () async {
      // *** Arrange *** //
      when(() => mockSectionsApi.apiGetSectionsList()).thenThrow(
          ApiNetworkException(
              message: 'Network Error')); // Throw ApiNetworkException

      // *** Act *** //
      final result = await sectionsRepository.getSectionsList();

      // *** Assert *** //
      expect(result, isA<Result<List<Section>>>());
      // *** CORRECT ASSERTION FOR FAILURE ***
      result.when(
        success: (sections) {
          fail('Test should have failed with a NetworkException');
        },
        failure: (error) {
          expect(error, isA<NetworkException>()); // Expect a NetworkException
          expect(
            (error as NetworkException).message,
            'Network Error',
          );
          expect(error.message, 'Network Error'); // Check the message
        },
      );
      // *** VERIFY THE CALL ***
      verify(() => mockSectionsApi.apiGetSectionsList()).called(1);
    });

    test('should return UnauthorizedException on 401', () async {
      // *** Arrange *** //
      when(() => mockSectionsApi.apiGetSectionsList()).thenThrow(ApiException(
          code: 401,
          errorPayload:
              const ErrorResponseModel(title: 'Unauthorized', status: 401)));

      // *** Act *** //
      final result = await sectionsRepository.getSectionsList();

      // *** Assert *** //
      expect(result, isA<Result<List<Section>>>());
      // *** CORRECT ASSERTION FOR FAILURE ***
      result.when(
        success: (sections) {
          fail('Test should have failed with a DataLoadException');
        },
        failure: (error) {
          expect(error, isA<UnauthorizedException>());
          expect(
            error.toString(),
            'Unauthorized',
          ); // Or a more specific message check if you have one.
          expect(
            (error as UnauthorizedException).message,
            'Unauthorized',
          );
          expect(error.message,
              'Unauthorized'); // Check the message if possible
        },
      );
      // *** VERIFY THE CALL ***
      verify(() => mockSectionsApi.apiGetSectionsList()).called(1);
    });

    test('should return ValidationException on 400', () async {
      // *** Arrange *** //
      when(() => mockSectionsApi.apiGetSectionsList()).thenThrow(ApiException(
          code: 400,
          errorPayload:
              const ErrorResponseModel(title: 'Bad Request', status: 400)));

      // *** Act *** //
      final result = await sectionsRepository.getSectionsList();

      // *** Assert *** //
      expect(result, isA<Result<List<Section>>>());
      // *** CORRECT ASSERTION FOR FAILURE ***
      result.when(
        success: (sections) {
          fail('Test should have failed with a DataLoadException');
        },
        failure: (error) {
          expect(error, isA<ValidationException>());
          expect(
            error.toString(),
            'Bad Request',
          ); // Or a more specific message check if you have one.
        },
      );
      // *** VERIFY THE CALL ***
      verify(() => mockSectionsApi.apiGetSectionsList()).called(1);
    });
  });
}
