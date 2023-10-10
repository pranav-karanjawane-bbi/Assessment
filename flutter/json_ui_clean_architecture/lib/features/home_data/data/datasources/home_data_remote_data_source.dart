

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../../../core/error/faiure.dart';
import '../../../../core/util/utility.dart';
import '../../domain/entities/home_data.dart';
import 'home_data_local_data_source.dart';
import 'package:json_ui_clean_architecture/features/home_data/data/models/home_data_model.dart' as model;


abstract class HomeDataRemoteDataSource{

  Future<Either<Failure, List<HomeData>>> fetchData();
  Future<Either<Failure,List<model.HomeDataModel>>> readJsonRemote();

}

class HomeDataRemoteDataSourceImpl extends HomeDataRemoteDataSource{
  @override
  Future<Either<Failure, List<HomeData>>> fetchData() async{
    try{storedOnlineData =
    await http.read(Uri.parse('https://s3.eu-west-1.amazonaws.com/bbi.appsdata.2013/for_development/home_screen.json'));
    final data2 =  jsonDecode(storedOnlineData!);
    int lenData = data2.length;
    objList.clear();
    for (int i = 0; i < lenData; i++) {
      objList.add(model.HomeDataModel.fromJson(data2[i]));
    }
    return Right(objList);}
        on ServerFailure{return left(ServerFailure());}

  }

  @override
  Future<Either<Failure,List<model.HomeDataModel>>> readJsonRemote()async {
try{

  if (storedOnlineData == null) {
    await fetchData();
  }
  else {
    objList.clear();
    final data2 = jsonDecode(storedOnlineData!);
    int lenData = data2.length;
    for (int i = 0; i < lenData; i++) {
      objList.add(model.HomeDataModel.fromJson(data2[i]));
    }

  }//else

return Right (objList);}
on ServerFailure{return left(ServerFailure());}

  }

}


