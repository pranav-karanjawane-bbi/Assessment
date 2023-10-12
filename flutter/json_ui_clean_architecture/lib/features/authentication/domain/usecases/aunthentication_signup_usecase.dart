import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:json_ui_clean_architecture/core/usecases/usecase.dart';
import 'package:json_ui_clean_architecture/features/authentication/data/model/authentication_data_model.dart';
import 'package:json_ui_clean_architecture/features/authentication/domain/repositories/authentication_data_repository.dart';

import '../../../../core/error/faiure.dart';
import '../../../home_data/domain/entities/home_data.dart';
import '../../data/datasource/authentication_data_source.dart';
import '../entities/authentication_data.dart';

class AuthenticationSignupUsecase implements AuthenticationUseCase<AuthenticationData, Params>{
  AuthenticationSignupUsecase(this.authenticationDataRepository);
  final AuthenticationDataRepository authenticationDataRepository;


  @override
  Future<Either<Failure, AuthenticationData>> invoke(Params params) async{

    return await authenticationDataRepository.getAuthenticationSignup();
  }

  getValueToUsecaseFile(String name, String email, String password)async{
    return await authenticationDataRepository.getValueToUsecaseFile(name,email, password);

  }
}

class Params extends Equatable{
const Params({required this.email, required this.password, required this.name});
final String email;
final String password;
final String name;

  @override
  List<Object?> get props => [email,password, name];



}