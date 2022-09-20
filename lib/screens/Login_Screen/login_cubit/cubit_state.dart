abstract class LoginCubitstate{}
class InitialLoginState extends LoginCubitstate {}
class LoginLoadingState extends InitialLoginState {}
class LoginSuccessState extends InitialLoginState 
{
  final  uId;
  LoginSuccessState(this.uId);
}
class LoginErrorState extends InitialLoginState 
{
  final  error;
  LoginErrorState(this.error);
}

