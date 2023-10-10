import 'package:get_it/get_it.dart';
import 'package:json_ui_clean_architecture/features/home_data/data/datasources/home_data_local_data_source.dart';
import 'package:json_ui_clean_architecture/features/home_data/data/datasources/home_data_remote_data_source.dart';
import 'package:json_ui_clean_architecture/features/home_data/data/repositories/home_data_repository_impl.dart';
import 'package:json_ui_clean_architecture/features/home_data/domain/repositories/home_data_repository.dart';
import 'package:json_ui_clean_architecture/features/home_data/domain/usecase/get_offline_home_data.dart';
import 'package:json_ui_clean_architecture/features/home_data/presentation/bloc/home_data_bloc.dart';

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


}