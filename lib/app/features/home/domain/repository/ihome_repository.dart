import 'package:appaguaentregados/app/common/error/failure.dart';
import 'package:appaguaentregados/app/features/home/domain/entity/home_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepositoryImpl {
  Future<Either<Failure, List<HomeEntity>>> getQuantidade();
}
