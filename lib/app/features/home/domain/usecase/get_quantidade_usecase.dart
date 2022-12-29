import 'package:appaguaentregados/app/common/error/failure.dart';
import 'package:appaguaentregados/app/features/home/domain/entity/home_entity.dart';
import 'package:appaguaentregados/app/features/home/domain/repository/ihome_repository.dart';
import 'package:dartz/dartz.dart';

class GetQuantidadeUseCase {
  final HomeRepositoryImpl repository;

  GetQuantidadeUseCase({
    required this.repository,
  });

  Future<Either<Failure, List<HomeEntity>>> call() async {
    return repository.getQuantidade();
  }
}
