import 'package:firebase_core/firebase_core.dart';

import 'analytics.dart';
import 'firebase_options.dart';


class FirebaseInitializer {
  static FirebaseInitializer? _instance;

  FirebaseInitializer._();

  factory FirebaseInitializer() => _instance ??= FirebaseInitializer._();

  bool _initialized = false;

  Future<void> init() async {
    if (!_initialized) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      // start initialization futures at the same time to speed up initial load
      await Future.wait<void>([
        _initializeAnalytics(),
      ]);

      _initialized = true;
    }
  }

  Future<void> _initializeAnalytics() async {
    await Analytics.setAnalyticsCollectionEnabled(true);
  }
}
