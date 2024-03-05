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
    apiKey: 'AIzaSyDPV7z-rpBw5IkRBUgnJdJFWykRKCtsdQA',
    appId: '1:888038063008:web:27631104756a011800c2c5',
    messagingSenderId: '888038063008',
    projectId: 'foodie-960f5',
    authDomain: 'foodie-960f5.firebaseapp.com',
    storageBucket: 'foodie-960f5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYvEFxvPdp1Gh2KfGBeGpEDrMMZt_ST1U',
    appId: '1:888038063008:android:97a1dcd2cfeecab200c2c5',
    messagingSenderId: '888038063008',
    projectId: 'foodie-960f5',
    storageBucket: 'foodie-960f5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDA8a0atlIVIHPkTGWGh_rlJvAaWYA1JBs',
    appId: '1:888038063008:ios:ada05ed0c42907c200c2c5',
    messagingSenderId: '888038063008',
    projectId: 'foodie-960f5',
    storageBucket: 'foodie-960f5.appspot.com',
    iosClientId: '888038063008-ngam97fkbi6f6ei0kq55982sr5pk0r2c.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodie',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDA8a0atlIVIHPkTGWGh_rlJvAaWYA1JBs',
    appId: '1:888038063008:ios:78f3a041c208b0b400c2c5',
    messagingSenderId: '888038063008',
    projectId: 'foodie-960f5',
    storageBucket: 'foodie-960f5.appspot.com',
    iosClientId: '888038063008-g6fe7r0bt8ahkmkg1d8qj9anel9vjurv.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodie.RunnerTests',
  );
}
