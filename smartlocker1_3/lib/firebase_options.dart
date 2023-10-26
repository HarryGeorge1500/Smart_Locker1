// this file is used to send and receive data to and from firebase server
//corresponding api key, app id etc are provided in this file.

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
    apiKey: 'AIzaSyCCv63hbO5lEIwlLiPqkkIM2aY3WTb9NZ0',
    appId: '1:664646566287:web:abadd795e2cd407ee70bfa',
    messagingSenderId: '664646566287',
    projectId: 'smart-lock-acf9d',
    authDomain: 'smart-lock-acf9d.firebaseapp.com',
    storageBucket: 'smart-lock-acf9d.appspot.com',
    measurementId: 'G-VZE0VN6LHT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4-qOivDoO1ujHAPIAKa16PI0c5xJvVZ4',
    appId: '1:664646566287:android:0e68ed5dfd84a40ee70bfa',
    messagingSenderId: '664646566287',
    projectId: 'smart-lock-acf9d',
    storageBucket: 'smart-lock-acf9d.appspot.com',
  );
}
