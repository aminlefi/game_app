import 'package:flutter/material.dart';
import 'screens/game_purchase_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/library_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/library',
      routes: {
        '/purchase': (context) => const GamePurchaseScreen(),
        '/register': (context) => RegistrationScreen(),
        '/library': (context) => const LibraryScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
