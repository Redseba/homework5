import 'package:flutter/material.dart';
import 'screens/setup_screen.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trivia Quiz App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/setup',
      routes: {
        '/setup': (context) => SetupScreen(), // Updated to use SetupScreen
        '/quiz': (context) => QuizScreen(),
      },
    );
  }
}
