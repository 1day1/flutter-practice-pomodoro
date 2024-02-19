import 'package:flutter/material.dart';
import 'package:pomodoro/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
        colorScheme: const ColorScheme(
          background: Color(0xFFE7626C),
          brightness: Brightness.dark,
          primary: Color(0xFFE7626C),
          onPrimary: Color(0xFFE7626C),
          secondary: Color(0xFFE7626C),
          onSecondary: Color(0xFFE7626C),
          error: Color(0xFFE7626C),
          onError: Color(0xFFE7626C),
          onBackground: Color(0xFFE7626C),
          surface: Color(0xFFE7626C),
          onSurface: Color(0xFFE7626C),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
