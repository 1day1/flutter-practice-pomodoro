import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoro/screens/home_screen.dart';
import 'package:pomodoro/screens/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isOnboarding = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      theme: ThemeData(
        shadowColor: const Color(0xFF010101),
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
      home: isOnboarding ? const OnboardingPage() : const HomeScreen(),
    );
  }
}
