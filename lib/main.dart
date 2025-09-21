import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'screens/game_purchase_screen.dart';
import 'screens/registration_screen.dart';

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
      initialRoute: '/purchase',
      routes: {
        '/purchase': (context) => GamePurchaseScreen(),
        '/register': (context) => RegistrationScreen(),
      },
    );
  }
}
