import 'package:dartz/dartz.dart';
import 'package:json_ui_clean_architecture/features/authentication/data/model/authentication_data_model.dart';
import 'package:json_ui_clean_architecture/features/authentication/domain/entities/authentication_data.dart';
import 'package:json_ui_clean_architecture/features/authentication/domain/repositories/authentication_data_repository.dart';

import '../../../../core/error/faiure.dart';
import '../../../../core/util/utility.dart';
import '../../../home_data/domain/entities/home_data.dart';
import '../../data/datasource/authentication_data_source.dart';

class AuthenticationLoginUsecase{
 AuthenticationLoginUsecase(this.authenticationDataRepository);

  final AuthenticationDataRepository authenticationDataRepository;

 @override
 Future<Either<Failure, AuthenticationData>> call() async{

   return await authenticationDataRepository.getAuthenticationLogin() ;
 }
}