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
    apiKey: 'AIzaSyCa2COOfy1wHy7axnNGNgx16XUndL_9sJo',
    appId: '1:85060078792:web:bd2794703c080a3ff269fd',
    messagingSenderId: '85060078792',
    projectId: 'fir-auth-tutorial-6a3cd',
    authDomain: 'fir-auth-tutorial-6a3cd.firebaseapp.com',
    storageBucket: 'fir-auth-tutorial-6a3cd.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3U2OYnxWSzQqfolcW7bhQUuMzMIGhZF8',
    appId: '1:85060078792:android:b569a77fe7a54444f269fd',
    messagingSenderId: '85060078792',
    projectId: 'fir-auth-tutorial-6a3cd',
    storageBucket: 'fir-auth-tutorial-6a3cd.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxaXLDRNCJJBCCtk7HaJH2zdeq5B_NLvw',
    appId: '1:85060078792:ios:0e7fba1e55d92011f269fd',
    messagingSenderId: '85060078792',
    projectId: 'fir-auth-tutorial-6a3cd',
    storageBucket: 'fir-auth-tutorial-6a3cd.firebasestorage.app',
    iosBundleId: 'com.example.firebaseAuthTutorial',
  );




  
}
