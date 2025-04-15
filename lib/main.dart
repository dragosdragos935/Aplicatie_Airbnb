import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/welcome/welcome_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/main/main_screen.dart';
import 'screens/admin/add_property_screen.dart';
import 'screens/admin/add_trip_screen.dart';
import 'providers/auth_provider.dart';
import 'providers/property_provider.dart';
import 'providers/trip_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => PropertyProvider()),
        ChangeNotifierProvider(create: (_) => TripProvider()),
      ],
      child: MaterialApp(
        title: 'Airbnb Clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFFE3C5B),
            brightness: Brightness.light,
          ),
          useMaterial3: true,
        ),
        home: const WelcomeScreen(),
        routes: {
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignupScreen(),
          '/main': (context) => const MainScreen(),
          '/add-property': (context) => const AddPropertyScreen(),
          '/add-trip': (context) => const AddTripScreen(),
        },
      ),
    );
  }
}
