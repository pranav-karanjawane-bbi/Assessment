import 'package:dartz/dartz.dart';
import 'package:json_ui_clean_architecture/core/error/faiure.dart';

import '../entities/home_data.dart';

abstract class HomeDataRepository {
   // Future<Either<Failure, bool>>getSwitchedValue(bool isSwitched);
   Future<Either<Failure, List<HomeData>>>getOfflineSwitchedValue(isSwitched);
   Future<Either<Failure, List<HomeData>>>getOnlineSwitchedValue(isSwitched);
}

