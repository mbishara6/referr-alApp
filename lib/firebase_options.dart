// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBGGRhvJlLwF4esrfeAXD7XSsAu3WKXENY',
    appId: '1:434178376351:web:e08a8318618695178818aa',
    messagingSenderId: '434178376351',
    projectId: 'cryptoapp-a38f1',
    authDomain: 'cryptoapp-a38f1.firebaseapp.com',
    storageBucket: 'cryptoapp-a38f1.firebasestorage.app',
    measurementId: 'G-4XP0GCGLPR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNisjs65ryyfjNC3OtejC8u1CQg7FkfK0',
    appId: '1:434178376351:android:b9c3e9a441b6c5498818aa',
    messagingSenderId: '434178376351',
    projectId: 'cryptoapp-a38f1',
    storageBucket: 'cryptoapp-a38f1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPNFibZ_6jNLfNZRpjgfVooxeQ9HsS3uc',
    appId: '1:434178376351:ios:99043bde40de31548818aa',
    messagingSenderId: '434178376351',
    projectId: 'cryptoapp-a38f1',
    storageBucket: 'cryptoapp-a38f1.firebasestorage.app',
    iosBundleId: 'com.example.cryptoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDPNFibZ_6jNLfNZRpjgfVooxeQ9HsS3uc',
    appId: '1:434178376351:ios:99043bde40de31548818aa',
    messagingSenderId: '434178376351',
    projectId: 'cryptoapp-a38f1',
    storageBucket: 'cryptoapp-a38f1.firebasestorage.app',
    iosBundleId: 'com.example.cryptoApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBGGRhvJlLwF4esrfeAXD7XSsAu3WKXENY',
    appId: '1:434178376351:web:d62d46182ea2dc528818aa',
    messagingSenderId: '434178376351',
    projectId: 'cryptoapp-a38f1',
    authDomain: 'cryptoapp-a38f1.firebaseapp.com',
    storageBucket: 'cryptoapp-a38f1.firebasestorage.app',
    measurementId: 'G-B4TYQSYLQW',
  );
}
