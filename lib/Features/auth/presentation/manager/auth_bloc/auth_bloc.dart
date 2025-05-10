import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_library_app/Features/auth/data/repos/auth_repo.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;

  AuthBloc(this.authRepo) : super(AuthInitial()) {
    on<AuthLoginRequested>(_onLogin);
    on<AuthRegisterRequested>(_onRegister);
    on<AuthLogoutRequested>(_onLogout);
    on<AuthCheckRequested>(_onCheckAuth);
  }

  Future<void> _onLogin(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await authRepo.signIn(email: event.email, password: event.password);
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onRegister(
    AuthRegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await authRepo.signUp(
        email: event.email,
        password: event.password,
      );
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onLogout(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await authRepo.signOut();
    emit(Unauthenticated());
  }

  void _onCheckAuth(AuthCheckRequested event, Emitter<AuthState> emit) {
    final user = authRepo.currentUser;
    if (user != null) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }
}
