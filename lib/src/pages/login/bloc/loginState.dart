// part of 'login_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../widgets/password.dart';
import '../widgets/username.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzSubmissionStatus.initial,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final Username username;
  final Password password;
  final bool isValid;

  LoginState copyWith({
    FormzSubmissionStatus? status,
    Username? username,
    Password? password,
    bool? isValid,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, username, password];
}


class LoginLoading extends LoginState {
  const LoginLoading({
    FormzSubmissionStatus status = FormzSubmissionStatus.inProgress,
    Username username = const Username.pure(),
    Password password = const Password.pure(),
    bool isValid = false,
  }) : super(
    status: status,
    username: username,
    password: password,
    isValid: isValid,
  );
}

class LoginSuccess extends LoginState {
  const LoginSuccess({
    FormzSubmissionStatus status = FormzSubmissionStatus.success,
    Username username = const Username.pure(),
    Password password = const Password.pure(),
    bool isValid = false,
  }) : super(
    status: status,
    username: username,
    password: password,
    isValid: isValid,
  );
}

class LoginFailure extends LoginState {
  const LoginFailure({
    this.error = '',
    FormzSubmissionStatus status = FormzSubmissionStatus.failure,
    Username username = const Username.pure(),
    Password password = const Password.pure(),
    bool isValid = false,
  }) : super(
    status: status,
    username: username,
    password: password,
    isValid: isValid,
  );

  final String error;

  @override
  List<Object> get props => [status, username, password, error];
}