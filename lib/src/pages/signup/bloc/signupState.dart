// part of 'login_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../widgets/password.dart';
import '../widgets/username.dart';
import '../widgets/email.dart';

class SignupState extends Equatable {
  const SignupState({
    this.status = FormzSubmissionStatus.initial,
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final Username username;
  final Password password;
  final Email email;
  final bool isValid;

  SignupState copyWith({
    FormzSubmissionStatus? status,
    Username? username,
    Email? email,
    Password? password,
    bool? isValid,
  }) {
    return SignupState(
      status: status ?? this.status,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, username, email, password];
}


class SignupLoading extends SignupState {
  const SignupLoading({
    FormzSubmissionStatus status = FormzSubmissionStatus.inProgress,
    Username username = const Username.pure(),
    Email email = const Email.pure(),
    Password password = const Password.pure(),
    bool isValid = false,
  }) : super(
    status: status,
    username: username,
    email: email,
    password: password,
    isValid: isValid,
  );
}

class SignupSuccess extends SignupState {
  const SignupSuccess({
    FormzSubmissionStatus status = FormzSubmissionStatus.success,
    Username username = const Username.pure(),
    Email email = const Email.pure(),
    Password password = const Password.pure(),
    bool isValid = false,
  }) : super(
    status: status,
    username: username,
    email: email,
    password: password,
    isValid: isValid,
  );
}

class SignupFailure extends SignupState {
  const SignupFailure({
    this.error = '',
    FormzSubmissionStatus status = FormzSubmissionStatus.failure,
    Username username = const Username.pure(),
    Email email = const Email.pure(),
    Password password = const Password.pure(),
    bool isValid = false,
  }) : super(
    status: status,
    username: username,
    email: email,
    password: password,
    isValid: isValid,
  );

  final String error;

  @override
  List<Object> get props => [status, username, email, password, error];
}