import 'package:dartz/dartz.dart';

import '../../features/home_data/domain/entities/home_data.dart';
import '../error/faiure.dart';


abstract class UseCase<Type> {
  Future<Either<Failure, List<HomeData>>> call();
}
