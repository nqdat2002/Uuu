import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to the LoginScreen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });

    return const Scaffold(
      body: Center(
        child: Text(
          'Welcome to MyApp',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
