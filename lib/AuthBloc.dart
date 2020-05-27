import 'package:auth_demo/AuthEventBloc.dart';
import 'package:auth_demo/AuthStateBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{

  @override
  AuthState get initialState => AuthNotTried();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async*{
    if(event is AuthLogin){
      if (event.login == "login" && event.password == "12345")
        yield AuthSuccessful();
      else
        yield AuthError();
    }
  }
}