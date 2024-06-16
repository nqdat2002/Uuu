import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'package:uuu/src/bloc/simple_bloc_delegate.dart';
import 'package:uuu/src/commonWidget/bloc/bloc.dart';
import 'package:uuu/src/pages/authentication/bloc/authenticationBloc.dart';
import 'package:uuu/src/pages/login/bloc/bloc.dart';
import 'package:uuu/src/theme/bloc/theme_bloc.dart';
import 'src/pages/homePage/bloc/bloc.dart';
import 'src/pages/newsDetail/bloc/bloc.dart';
import 'src/resources/repository.dart';
import 'app.dart';

void main() {
  BlocObserver observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AuthenticationRepository _authenticationRepository;
  late final UserRepository _userRepository;

  @override
  void initState() {
    super.initState();
    _authenticationRepository = AuthenticationRepository();
    _userRepository = UserRepository();
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationBloc(
              authenticationRepository: _authenticationRepository,
              userRepository: _userRepository,
            ),
          ),
          BlocProvider<NewsBloc>(
            create: (context) => NewsBloc(repository: Repository())..add(const Fetch(type: 'General')),
          ),
          BlocProvider<DetailBloc>(create: (context) => DetailBloc()),
          BlocProvider<NavigationBloc>(create: (context) => NavigationBloc()),
          BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(authenticationRepository: _authenticationRepository),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}
