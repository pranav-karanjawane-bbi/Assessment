import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:json_ui_clean_architecture/core/error/faiure.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/utility.dart';
import '../entities/home_data.dart';
import '../repositories/home_data_repository.dart';

class GetOnlineSwitchedValue implements UseCase<bool> {

  GetOnlineSwitchedValue(this.repository);

  final HomeDataRepository repository;

  @override
  Future<Either<Failure, List<HomeData>>> call() async{

    return await repository.getOnlineSwitchedValue(isSwitched);
  }
}

// class Params extends Equatable{
//   const Params({required this.switchedValue});
//   final bool switchedValue;
//
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [switchedValue];}