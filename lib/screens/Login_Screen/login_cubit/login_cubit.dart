
import 'package:chaty/screens/Login_Screen/login_cubit/cubit_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginCubit extends Cubit<InitialLoginState> {
  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);
  void userLogin({required String email, required String password}) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
          
      print('Login Done');
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((error) {
      print('Error In User Login');
      emit(LoginErrorState(error));
    });
  }
}
