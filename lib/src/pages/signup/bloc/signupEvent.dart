
import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupUsernameChanged extends SignupEvent {
  const SignupUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class SignupPasswordChanged extends SignupEvent {
  const SignupPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class SignupEmailChanged extends SignupEvent{
  const SignupEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class SignupSubmitted extends SignupEvent {
  final String username;
  final String password;
  final String email;

  const SignupSubmitted({required this.username, required this.email, required this.password});

  @override
  List<Object> get props => [username, email, password];
}