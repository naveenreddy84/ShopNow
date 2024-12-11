import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Authentication/SignUpPage.dart';
import 'Authentication/LoginPage.dart';
import 'package:shopnow/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Auth',
      initialRoute: '/login',
      routes: {
        '/signup': (context) => SignUpPage(),
        '/login': (context) => LoginPage(),
        '/HomePage': (context) => HomePage(),

      },
    );
  }
}

