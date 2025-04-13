import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Airbnb Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF5A5F),
          primary: const Color(0xFFFF5A5F),
        ),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
