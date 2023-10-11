import 'package:dartz/dartz.dart';
import 'package:json_ui_clean_architecture/core/error/faiure.dart';
import 'package:json_ui_clean_architecture/core/util/utility.dart';
import 'package:json_ui_clean_architecture/features/home_data/data/models/home_data_model.dart';
import 'package:json_ui_clean_architecture/features/home_data/domain/repositories/home_data_repository.dart';

import '../../domain/entities/home_data.dart';
import '../datasources/home_data_local_data_source.dart';
import '../datasources/home_data_remote_data_source.dart';

class HomeDataRepositoryImpl implements HomeDataRepository{
  HomeDataRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource});

  late final HomeDataLocalDataSource localDataSource;
 late final HomeDataRemoteDataSource remoteDataSource;
  Future<Either<Failure, bool>> getSwitchedValue(bool isSwitched) {
   throw (isSwitched);
  }

  @override
  Future<Either<Failure, List<HomeData>>> getOfflineSwitchedValue(isSwitched) async{
    return _getData();
  }

  @override
  Future<Either<Failure, List<HomeData>>> getOnlineSwitchedValue(isSwitched) {
    return _getData();
  }


  Future<Either<Failure, List<HomeDataModel>>> _getData()async{
  if (isSwitched! == false) {
    try{
      // await localDataSource.fetchAssetData();
      await localDataSource.readJsonLocal();
    } on CacheFailure{
          return Left(CacheFailure());
        }

  }

  if(isSwitched! == true) {
    try{
      // await remoteDataSource.fetchData();
      await remoteDataSource.readJsonRemote();
    }on ServerFailure{
      return left(ServerFailure());
    }
  }
  return Right(objList);
}
}


// Future<List<HomeDataModel>> readJson() async {
//   if (isSwitched! == false) {
//     await readJsonLocal();
//   }
//
//   if(isSwitched! == true) {
//     await readJsonRemote();
//   }
//
//   return(objList);
// }
//






