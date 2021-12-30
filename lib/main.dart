import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_social_app/routes/home.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Social App',
      theme: ThemeData(
          colorScheme: ColorScheme(
              primary: Color(0xFF66bb6a),
              onPrimary: Color(0xFF000000),
              primaryVariant: Color(0xFF338a3e),
              background: Color(0xFF98ee99),
              onBackground: Color(0xFF000000),
              secondary: Color(0xFF29b6f6),
              onSecondary: Color(0xFF000000),
              secondaryVariant: Color(0xFF0086c3),
              surface: Color(0xFF73e8ff),
              onSurface: Color(0xFF000000),
              error: Color(0xFFc62828),
              onError: Color(0xFFFFFFFF),
              brightness: Brightness.light)),
      home: Home(),
    );
  }
}
