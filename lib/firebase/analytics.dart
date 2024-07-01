import 'package:firebase_analytics/firebase_analytics.dart';

abstract class Analytics {
  static final _firebaseAnalytics = _FirebaseAnalytics();

  static Future<void> setUserId(String uuid) async {
    await _firebaseAnalytics.setUserId(uuid);
  }

  static Future<void> logEvent(AnalyticEvent event) async {
    _firebaseAnalytics.logEvent(event);
  }

  static Future<void> logScreen(Type screen) async {
    _firebaseAnalytics.logScreen(screen);
  }

  static Future<void> setAnalyticsCollectionEnabled(bool enabled) async {
    await _firebaseAnalytics.setAnalyticsCollectionEnabled(enabled);
  }
}

/// Analytic events used to track Google Analytics
enum AnalyticEvent {
  turningOnFirebaseAnalytics,
  turningOffFirebaseAnalytics,
  //todo Add event names here to start tracking events
}

class _FirebaseAnalytics {
  Future<void> setUserId(String uuid) async {
    await FirebaseAnalytics.instance.setUserId(id: uuid.isEmpty ? null : uuid);
  }

  Future<void> logEvent(AnalyticEvent event) async {
    await FirebaseAnalytics.instance.logEvent(
      name: event.name,
      parameters: {
        // 'END-POINT-ENVIRONMENT': EnvConfig.env.toString()
      },
    );
  }

  Future<void> logScreen(Type screen) async {
    await FirebaseAnalytics.instance.logScreenView(
      screenName: '$screen',
      screenClass: '$screen',
    );
  }

  Future<void> setAnalyticsCollectionEnabled(bool enabled) async {
    if (!enabled) {
      logEvent(AnalyticEvent.turningOffFirebaseAnalytics);
    }

    await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(enabled);

    if (enabled) {
      logEvent(AnalyticEvent.turningOnFirebaseAnalytics);
    }
  }
}

