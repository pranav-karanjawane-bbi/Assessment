part of 'authentication_data_bloc.dart';

@immutable
abstract class AuthenticationDataEvent {}

class AuthenticationDataSignupEvent extends AuthenticationDataEvent {}
class AuthenticationDataLoginEvent extends AuthenticationDataEvent {}
class AuthenticationDataLoginToSignupEvent extends AuthenticationDataEvent{}

// class SignupPageInputEvent extends AuthenticationDataEvent {
//    SignupPageInputEvent({required this.name, required this.email, required this.password});
//
//   final String name; final String email; final String password;
// }
