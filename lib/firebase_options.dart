// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCz2__FxaERGEnW55eBNqSRl0QiKJkBfpk',
    appId: '1:25093598876:web:0f9c740e9e24aad79f4759',
    messagingSenderId: '25093598876',
    projectId: 'authcubit-9ca18',
    authDomain: 'authcubit-9ca18.firebaseapp.com',
    storageBucket: 'authcubit-9ca18.appspot.com',
    measurementId: 'G-58HX6FNN60',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCML7n7aMhWkk_MPxQwrP5XHE2pKbeEg6s',
    appId: '1:25093598876:android:c4d923ec5932f4499f4759',
    messagingSenderId: '25093598876',
    projectId: 'authcubit-9ca18',
    storageBucket: 'authcubit-9ca18.appspot.com',
  );
}
