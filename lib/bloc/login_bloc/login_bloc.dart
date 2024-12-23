import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    // Registrar o handler para LoginRequested
    on<LoginRequested>((event, emit) async {
      emit(LoginLoading());
      await Future.delayed(
          const Duration(seconds: 2)); // Simula o tempo de login

      if (event.username == 'user' && event.password == 'password') {
        // Salvando o estado de login com SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);

        emit(LoginSuccess(event.username));
      } else {
        emit(LoginFailure('Usuário ou senha incorretos'));
      }
    });

    // Registrar o handler para LogoutRequested
    on<LogoutRequested>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);

      emit(LoginInitial());
    });
  }
}
