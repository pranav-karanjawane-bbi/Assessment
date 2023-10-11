import 'package:get_it/get_it.dart';
import 'package:json_ui_clean_architecture/features/authentication/data/datasource/authentication_data_source.dart';
import 'package:json_ui_clean_architecture/features/authentication/data/repository/authentication_data_repository_impl.dart';
import 'package:json_ui_clean_architecture/features/authentication/domain/repositories/authentication_data_repository.dart';
import 'package:json_ui_clean_architecture/features/authentication/domain/usecases/aunthentication_signup_usecase.dart';
import 'package:json_ui_clean_architecture/features/authentication/presentation/bloc/authentication_data_bloc.dart';
import 'package:json_ui_clean_architecture/features/home_data/data/datasources/home_data_local_data_source.dart';
import 'package:json_ui_clean_architecture/features/home_data/data/datasources/home_data_remote_data_source.dart';
import 'package:json_ui_clean_architecture/features/home_data/data/repositories/home_data_repository_impl.dart';
import 'package:json_ui_clean_architecture/features/home_data/domain/repositories/home_data_repository.dart';
import 'package:json_ui_clean_architecture/features/home_data/domain/usecase/get_offline_home_data.dart';
import 'package:json_ui_clean_architecture/features/home_data/presentation/bloc/home_data_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/authentication/domain/usecases/aunthentication_login_usecase.dart';
import 'features/home_data/domain/usecase/get_online_home_data.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //bloc
  sl.registerFactory(() => HomeDataBloc(
      getOfflineSwitchedValue: sl(),
      getOnlineSwitchedValue: sl()
  ));

  //usecases
  sl.registerLazySingleton(() => GetOfflineSwitchedValue(sl()));
  sl.registerLazySingleton(() => GetOnlineSwitchedValue(sl()));


  //repository
  sl.registerLazySingleton<HomeDataRepository>(
      ()=> HomeDataRepositoryImpl(
          localDataSource: sl(),
          remoteDataSource: sl())
  );


  // datasource
  sl.registerLazySingleton<HomeDataRemoteDataSource>(
      ()=>HomeDataRemoteDataSourceImpl()
  );

  sl.registerLazySingleton<HomeDataLocalDataSource>(
      ()=> HomeDataLocalDataSourceImpl()
  );



  //bloc for authentication

  sl.registerFactory(() => AuthenticationDataBloc(
      authenticationLoginUsecase: sl(),
      authenticationSignupUsecase: sl()));

  //usecase
  sl.registerLazySingleton(() => AuthenticationLoginUsecase(sl()));
  sl.registerLazySingleton(() => AuthenticationSignupUsecase(sl()));

  // repository
  sl.registerLazySingleton<AuthenticationDataRepository>(
          () => AuthenticationDataRepositoryImpl(dataSource: sl()));
  //datasource
  sl.registerLazySingleton<AuthenticationDataSource>(
      () => AuthenticationDataSourceImpl()
  );


  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingletonAsync(() async => sharedPreferences);

}

