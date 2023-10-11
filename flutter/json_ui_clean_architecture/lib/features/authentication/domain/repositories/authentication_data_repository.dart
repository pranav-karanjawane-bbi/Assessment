import 'package:dartz/dartz.dart';
import 'package:json_ui_clean_architecture/core/error/faiure.dart';
import 'package:json_ui_clean_architecture/features/authentication/data/model/authentication_data_model.dart';

import '../entities/authentication_data.dart';



abstract class AuthenticationDataRepository {
  // Future<Either<Failure, bool>>getSwitchedValue(bool isSwitched);
  Future<Either<Failure, AuthenticationModel>>getAuthenticationLogin();
  Future<Either<Failure, AuthenticationModel>>getAuthenticationSignup();

}