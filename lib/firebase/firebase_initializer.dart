import 'package:firebase_core/firebase_core.dart';
import 'package:kanban_tasks_list_flutter/utils.dart';

import 'analytics.dart';
import 'firebase_options.dart';


class FirebaseInitializer {
  static FirebaseInitializer? _instance;

  FirebaseInitializer._();

  factory FirebaseInitializer() => _instance ??= FirebaseInitializer._();

  bool _initialized = false;

  Future<void> init() async {
    if (!_initialized) {
      logData('FirebaseInitializer', 'Initializing Firebase');
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      // start initialization futures at the same time to speed up initial load
      await Future.wait<void>([
        _initializeAnalytics(),
      ]);

      _initialized = true;
    } else {
      logData('FirebaseInitializer', 'Firebase already initialized...');
    }
  }

  Future<void> _initializeAnalytics() async {
    await Analytics.setAnalyticsCollectionEnabled(true);
  }
}
