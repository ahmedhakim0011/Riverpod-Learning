import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/future_provide_example.dart';
import 'package:riverpod_learning/screens/login_screen.dart';
import 'package:riverpod_learning/screens/signup_screen.dart';
import 'package:riverpod_learning/state_provider_example.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  LoginScreen(),
      routes: {
        '/signup': (_) => SignupScreen(),
      },
    );
  }
}
