
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
  getValueToUsecaseFile(String name, String email, String password) {
    return dataSource.setUserDataLocal( name,  email,  password);
  }


  Future<bool?> validateData(String inputEmail, String inputPassword)  async {
    var fetchedApiData = await dataSource.getUserDataApi() as Map;
    int? emailResult;
    int? passwordResult;
    int? emailResultOnline;
    int? passwordResultOnline;


    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    //
    try {
      final String? signUpEmail = prefs!.getString('signUpEmail');
      final String? signUpPassword = prefs!.getString('signUpPassword');

      if (signUpEmail!.isEmpty) {
        String onlineEmail = fetchedApiData['email'];
        String onlinePassword = fetchedApiData['password'];

        emailResultOnline = inputEmail.compareTo(onlineEmail);
        passwordResultOnline = inputPassword.compareTo(onlinePassword);

        if (inputEmail.isEmpty) {
          decision = false;
        } else {
          if ((emailResultOnline == 0 && passwordResultOnline == 0)) {
            decision = true;
          }
          else {
            decision = false;
          }
        }
      }
      else {
        emailResult = inputEmail.compareTo(signUpEmail!);
        passwordResult = inputPassword.compareTo(signUpPassword!);

        if (inputEmail.isEmpty) {
          decision = false;
        } else {
          if ((emailResult == 0 && passwordResult == 0)) {
            decision = true;
          }

          else {
            decision = false;
          }
        }
      }
    } catch (e) {
      final String? signUpEmail = inputEmail;
      final String? signUpPassword = inputPassword;

      if (signUpEmail!.isEmpty) {
        String onlineEmail = fetchedApiData['email'];
        String onlinePassword = fetchedApiData['password'];

        emailResultOnline = inputEmail.compareTo(onlineEmail);
        passwordResultOnline = inputPassword.compareTo(onlinePassword);

        if (inputEmail.isEmpty) {
          decision = false;
        } else {
          if ((emailResultOnline == 0 && passwordResultOnline == 0)) {
            decision = true;
          }
          else {
            decision = false;
          }
        }
      }
      else {
        emailResult = inputEmail.compareTo(signUpEmail!);
        passwordResult = inputPassword.compareTo(signUpPassword!);

        if (inputEmail.isEmpty) {
          decision = false;
        } else {
          if ((emailResult == 0 && passwordResult == 0)) {
            decision = true;
          }

          else {
            decision = false;
          }
        }
      }
    }
    return decision;
  }




  //   // final String signupEmail = userData[1];
  //   if(signUpEmail!.isEmpty){
  //     String onlineEmail = fetchedApiData['email'];
  //     String onlinePassword = fetchedApiData['password'];
  //
  //     emailResultOnline = inputEmail.compareTo(onlineEmail);
  //     passwordResultOnline = inputPassword.compareTo(onlinePassword);
  //
  //     if (inputEmail.isEmpty) {
  //       decision = false;
  //     } else {
  //       if ((emailResultOnline == 0 && passwordResultOnline == 0)) {
  //         decision = true;
  //       }
  //       else {
  //         decision = false;
  //       }
  //     }
  //   }
  //   else{
  //     emailResult = inputEmail.compareTo(signUpEmail!);
  //     passwordResult = inputPassword.compareTo(signUpPassword!);
  //
  //     if (inputEmail.isEmpty) {
  //       decision = false;
  //     } else {
  //       if ((emailResult == 0 && passwordResult == 0)) {
  //         decision = true;
  //       }
  //
  //       else {
  //         decision = false;
  //       }
  //     }
  //   }
  //
  //   return decision;
  // }



  @override
  Future<Either<Failure, AuthenticationModel>> getAuthenticationSignup() {

    throw UnimplementedError();
  }

  @override
  callAuthenticationForLogin(String email, String password) {
    return validateData(email, password);
  }

  @override
  Future<Either<Failure, AuthenticationModel>> getAuthenticationLogin() {
    // TODO: implement getAuthenticationLogin
    throw UnimplementedError();
  }
}
