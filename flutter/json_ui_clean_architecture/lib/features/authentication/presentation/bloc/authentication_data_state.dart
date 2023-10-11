part of 'authentication_data_bloc.dart';

@immutable
abstract class AuthenticationDataState {}

class AuthenticationDataInitial extends AuthenticationDataState {}
class AuthenticationDataSignupState extends AuthenticationDataState {}
class AuthenticationDataLoginState extends AuthenticationDataState {}
class AuthenticationDataLoginToSignupState extends AuthenticationDataState{}
