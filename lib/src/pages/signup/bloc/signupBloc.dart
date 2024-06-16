import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';

import '../widgets/password.dart';
import '../widgets/username.dart';
import '../widgets/email.dart';
import 'bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const SignupState()) {
    on<SignupUsernameChanged>(_onUsernameChanged);
    on<SignupEmailChanged>(_onEmailChanged);
    on<SignupPasswordChanged>(_onPasswordChanged);
    on<SignupSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onUsernameChanged(
      SignupUsernameChanged event,
      Emitter<SignupState> emit,
      ) {
    final username = Username.dirty(event.username);
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([state.password, state.email, username]),
      ),
    );
  }

  void _onPasswordChanged(
      SignupPasswordChanged event,
      Emitter<SignupState> emit,
      ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.username, state.email]),
      ),
    );
  }

  void _onEmailChanged(
      SignupEmailChanged event,
      Emitter<SignupState> emit,
      ) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.username, state.password]),
      ),
    );
  }

  Future<void> _onSubmitted(
      SignupSubmitted event,
      Emitter<SignupState> emit,
      ) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        await _authenticationRepository.signUp(
          username: state.username.value,
          email: state.email.value,
          password: state.password.value,
        );
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}