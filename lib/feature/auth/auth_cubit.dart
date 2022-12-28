import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  FirebaseAuth auth = FirebaseAuth.instance;

  void login({required String username, required String password}) async {
    emit(LoginLoading());

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: username, password: password);

      if (userCredential.user != null) {
        emit(LoginSuccess(user: userCredential.user!));
      } else {
        emit(LoginError(message: "An error occurred"));
      }
    } catch (ex) {
      emit(LoginError(message: ex.toString()));
    }
  }
}
