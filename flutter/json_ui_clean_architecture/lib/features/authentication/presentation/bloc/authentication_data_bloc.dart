import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/aunthentication_login_usecase.dart';
import '../../domain/usecases/aunthentication_signup_usecase.dart';

part 'authentication_data_event.dart';
part 'authentication_data_state.dart';

class AuthenticationDataBloc extends Bloc<AuthenticationDataEvent, AuthenticationDataState> {
  AuthenticationLoginUsecase authenticationLoginUsecase;
  AuthenticationSignupUsecase authenticationSignupUsecase;


  AuthenticationDataBloc({required this.authenticationLoginUsecase, required this.authenticationSignupUsecase})
      : super(AuthenticationDataInitial()) {
    // on<AuthenticationDataEvent>((event, emit) {
      on<AuthenticationDataSignupEvent> ((event, emit) => emit (AuthenticationDataSignupState()));

      on<AuthenticationDataLoginToSignupEvent> ((event, emit) => emit (AuthenticationDataLoginToSignupState()));

      on<AuthenticationDataLoginEvent> ((event, emit) => emit (AuthenticationDataLoginState()));

  }

  loadLoginScreen(){
    add(AuthenticationDataLoginEvent());
  }

  loadSignupScreen(){
    add(AuthenticationDataSignupEvent());
  }

  loadLoginToSignupScreen(){
    add(AuthenticationDataLoginToSignupEvent());
  }


  dynamic callAuthenticationForLogin()async{
    return await authenticationLoginUsecase();
  }

  dynamic callAuthenticationForSignup()async{
    return await authenticationSignupUsecase();
  }
}
