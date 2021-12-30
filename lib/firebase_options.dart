// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAqvTCiHU5PpklK2c0oxSp89bKhSyMzyow',
    appId: '1:110799949185:web:91e82a0cd186152efaec80',
    messagingSenderId: '110799949185',
    projectId: 'fluttersocialapp-302f8',
    authDomain: 'fluttersocialapp-302f8.firebaseapp.com',
    databaseURL: 'https://fluttersocialapp-302f8-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'fluttersocialapp-302f8.appspot.com',
    measurementId: 'G-PNQE5LS2LL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKwDOofdbNLUi00U840TyCh3qkME059xI',
    appId: '1:110799949185:android:8d1500d6d995c55cfaec80',
    messagingSenderId: '110799949185',
    projectId: 'fluttersocialapp-302f8',
    databaseURL: 'https://fluttersocialapp-302f8-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'fluttersocialapp-302f8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzXx1dHWsaimCIm2DF513b0EqOZjDRwBk',
    appId: '1:110799949185:ios:fb01d02ac1304abcfaec80',
    messagingSenderId: '110799949185',
    projectId: 'fluttersocialapp-302f8',
    databaseURL: 'https://fluttersocialapp-302f8-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'fluttersocialapp-302f8.appspot.com',
    androidClientId: '110799949185-5sdr1e3uonbi5tb9dlcq6g36hlr0ft62.apps.googleusercontent.com',
    iosClientId: '110799949185-ofr1d90ivgipci2c34lh5m5e6tpo5n1c.apps.googleusercontent.com',
    iosBundleId: 'com.akramabuowaimer.fluttersocialapp',
  );
}
