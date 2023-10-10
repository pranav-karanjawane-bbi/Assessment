import 'dart:convert';
import 'package:dartz/dartz.dart';

import '../../../../core/error/faiure.dart';
import '../../../../core/util/utility.dart';
import 'package:json_ui_clean_architecture/features/home_data/data/models/home_data_model.dart' as model;
import 'package:flutter/services.dart' show rootBundle;

import '../../domain/entities/home_data.dart';
import 'home_data_remote_data_source.dart';


abstract class HomeDataLocalDataSource{
  Future<Either<Failure, List<HomeData>>> fetchAssetData();
  Future<Either<Failure,List<model.HomeDataModel>>> readJsonLocal();

}

class HomeDataLocalDataSourceImpl extends HomeDataLocalDataSource {
  @override
  Future<Either<Failure, List<HomeData>>> fetchAssetData() async {
    try {
      storedAssetData =
      await rootBundle.loadString('assets/temp.json');
      final data = jsonDecode(storedAssetData!);
      int lenData = data.length;
      objList.clear();
      for (int i = 0; i < lenData; i++) {
        objList.add(model.HomeDataModel.fromJson(data[i]));
      }
      return Right(objList);
    }on CacheFailure{
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure,List<model.HomeDataModel>>> readJsonLocal() async {
    try{
      if (storedAssetData == null) {
        await fetchAssetData();
      }
      else {
        objList.clear();
        final data = await json.decode(storedAssetData!);
        int lenData = data.length;
        for (int i = 0; i < lenData; i++) {
          objList.add(model.HomeDataModel.fromJson(data[i]));
        }

        objList.sort((a, b) {
          return int.parse(a.sequenceNo!).compareTo(int.parse(b.sequenceNo!));
        });
        // return (objList);
      }

    return Right(objList);

  }on CacheFailure{
      return left(CacheFailure());
    }
    }
}