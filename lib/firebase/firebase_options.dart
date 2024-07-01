import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.iOS:
        return web;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
      apiKey: "add your apiKey",
      authDomain: "add your authDomain",
      projectId: "add your projectId",
      storageBucket: "add your storageBucket",
      messagingSenderId: "add your messagingSenderId",
      appId: "add your appId",
      measurementId: "add your measurementId");

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'add your apiKey',
    appId: 'add your appId',
    messagingSenderId: 'add your messagingSenderId',
    projectId: 'add your projectId',
    storageBucket: 'add your storageBucket',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'add your apiKey',
    appId: 'add your appId',
    messagingSenderId: 'add your messagingSenderId',
    projectId: 'add your projectId',
    storageBucket: 'add your storageBucket',
    iosBundleId: 'com.challenge.kanbanBoard',
  );
}
