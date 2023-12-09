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
    apiKey: 'AIzaSyDmKyLPkN19uxRpIzvg0dlz_abF7XQ4Eg4',
    appId: '1:586118175285:web:63bf3816540916ad272f7c',
    messagingSenderId: '586118175285',
    projectId: 'authentication-mbapp',
    authDomain: 'authentication-mbapp.firebaseapp.com',
    storageBucket: 'authentication-mbapp.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDB18KkXyUpw4QpBe5AVjin-0kuOatkgd4',
    appId: '1:586118175285:android:a5822d44d7611bd9272f7c',
    messagingSenderId: '586118175285',
    projectId: 'authentication-mbapp',
    storageBucket: 'authentication-mbapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADSNfcD3BPSG3bWKhBzwwTfseB0AglfEA',
    appId: '1:586118175285:ios:37011155f853f16f272f7c',
    messagingSenderId: '586118175285',
    projectId: 'authentication-mbapp',
    storageBucket: 'authentication-mbapp.appspot.com',
    iosBundleId: 'com.example.sdnProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADSNfcD3BPSG3bWKhBzwwTfseB0AglfEA',
    appId: '1:586118175285:ios:0cb1980c571e9336272f7c',
    messagingSenderId: '586118175285',
    projectId: 'authentication-mbapp',
    storageBucket: 'authentication-mbapp.appspot.com',
    iosBundleId: 'com.example.sdnProject.RunnerTests',
  );
}
