import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuu/src/pages/signup/widgets/signupForm.dart';

import 'bloc/bloc.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignupPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return SignupBloc(
              authenticationRepository:
              RepositoryProvider.of<AuthenticationRepository>(context),
            );
          },
          child: Column(
            children: [
              const SizedBox(height: 50),
              Center(
                child: Image.asset(
                  'assets/newsapi.png',
                  height: 100,
                  width: 100,
                ),
              ),
              const SizedBox(height: 50),
              const SignupForm(),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/login');
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
