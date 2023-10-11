part of 'authentication_data_bloc.dart';

@immutable
abstract class AuthenticationDataEvent {}

class AuthenticationDataSignupEvent extends AuthenticationDataEvent {}
class AuthenticationDataLoginEvent extends AuthenticationDataEvent {}
class AuthenticationDataLoginToSignupEvent extends AuthenticationDataEvent{}