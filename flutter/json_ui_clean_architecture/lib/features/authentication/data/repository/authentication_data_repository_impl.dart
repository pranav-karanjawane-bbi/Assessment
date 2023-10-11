
import 'package:dartz/dartz.dart';
import 'package:json_ui_clean_architecture/core/error/faiure.dart';
import 'package:json_ui_clean_architecture/features/authentication/data/datasource/authentication_data_source.dart';
import 'package:json_ui_clean_architecture/features/authentication/data/model/authentication_data_model.dart';
import 'package:json_ui_clean_architecture/features/authentication/domain/entities/authentication_data.dart';
import 'package:json_ui_clean_architecture/features/authentication/domain/repositories/authentication_data_repository.dart';


import '../../../../core/util/utility.dart';

class AuthenticationDataRepositoryImpl extends AuthenticationDataRepository {
  AuthenticationDataRepositoryImpl({
    required this.dataSource
  });

  final AuthenticationDataSource dataSource;

  @override
  Future<Either<Failure, AuthenticationModel>> getAuthenticationLogin() {
    return validateData(loginEmailController.text, loginPasswordController.text);
  }

  @override
  Future<Either<Failure, AuthenticationModel>> getAuthenticationSignup() {
    return dataSource.setUserDataLocal();
  }


  Future<Either<Failure, AuthenticationModel>> validateData(String inputEmail, String inputPassword)  async {
    var fetchedApiData = await dataSource.getUserDataApi() as Map;
    int? emailResult;
    int? passwordResult;
    int? emailResultOnline;
    int? passwordResultOnline;

    // final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? signUpEmail = prefs!.getString('signUpEmail');
    final String? signUpPassword = prefs!.getString('signUpPassword');


    // final String signupEmail = userData[1];


    String onlineEmail = fetchedApiData['email'];
    String onlinePassword = fetchedApiData['password'];

    emailResult = inputEmail.compareTo(signUpEmail!);
    passwordResult = inputPassword.compareTo(signUpPassword!);
    emailResultOnline = inputEmail.compareTo(onlineEmail);
    passwordResultOnline = inputPassword.compareTo(onlinePassword);

    if (inputEmail.isEmpty) {
      decision = false;
    } else {
      if ((emailResult == 0 && passwordResult == 0) ||
          (emailResultOnline == 0 && passwordResultOnline == 0)) {
        decision = true;
      }

      else {
        decision = false;
      }
    }
    return contianer();
  }

   contianer() {}
}
