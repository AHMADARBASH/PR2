import 'package:bloc/bloc.dart';
import 'package:hotely/blocs/auth/auth_states.dart';
import 'package:hotely/data/helpers/cache_helper.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(AuthState(
            isAuthenticated:
                CachedData.containsKey(key: 'token') ? true : false));

  void authUser() {
    emit(AuthState(isAuthenticated: true));
  }

  void deAuthUser() {
    emit(AuthState(isAuthenticated: false));
  }
}
