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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyDleEl86MJ_h7Pfs0BvPlAzAAUuK2t2rcQ',
    appId: '1:353010216354:web:0841c874be735947af96fb',
    messagingSenderId: '353010216354',
    projectId: 'study-app-8cc3e',
    authDomain: 'study-app-8cc3e.firebaseapp.com',
    storageBucket: 'study-app-8cc3e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDPgmhyRlPqQi8fTgdvrM8eqslW1kW9oEs',
    appId: '1:353010216354:android:c4d18ffe64e7c9aeaf96fb',
    messagingSenderId: '353010216354',
    projectId: 'study-app-8cc3e',
    storageBucket: 'study-app-8cc3e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC35kb88bE86K61UwgEVejs0EjeCSVxrLc',
    appId: '1:353010216354:ios:03e800ebecb94334af96fb',
    messagingSenderId: '353010216354',
    projectId: 'study-app-8cc3e',
    storageBucket: 'study-app-8cc3e.appspot.com',
    iosClientId: '353010216354-2b8ra64ljg4vpgpdmlaeemm0hh5m0csv.apps.googleusercontent.com',
    iosBundleId: 'com.example.studyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC35kb88bE86K61UwgEVejs0EjeCSVxrLc',
    appId: '1:353010216354:ios:cc7bebd037e903f1af96fb',
    messagingSenderId: '353010216354',
    projectId: 'study-app-8cc3e',
    storageBucket: 'study-app-8cc3e.appspot.com',
    iosClientId: '353010216354-ddcevbopi2ojgjvseb02d2t65up7i3gf.apps.googleusercontent.com',
    iosBundleId: 'com.example.studyApp.RunnerTests',
  );
}
