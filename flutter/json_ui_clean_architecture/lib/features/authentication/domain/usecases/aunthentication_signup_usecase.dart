import 'package:dartz/dartz.dart';
import 'package:json_ui_clean_architecture/features/authentication/data/model/authentication_data_model.dart';
import 'package:json_ui_clean_architecture/features/authentication/domain/repositories/authentication_data_repository.dart';

import '../../../../core/error/faiure.dart';
import '../../../home_data/domain/entities/home_data.dart';
import '../../data/datasource/authentication_data_source.dart';

class AuthenticationSignupUsecase{
  AuthenticationSignupUsecase(this.authenticationDataRepository);
  final AuthenticationDataRepository authenticationDataRepository;

  @override
  Future<Either<Failure, AuthenticationModel>> call() async{

    return await authenticationDataRepository.getAuthenticationSignup();
  }
}