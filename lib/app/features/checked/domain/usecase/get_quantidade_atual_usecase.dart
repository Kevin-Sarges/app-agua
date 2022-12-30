import 'package:appaguaentregados/app/common/error/failure.dart';
import 'package:appaguaentregados/app/features/checked/domain/entyity/checked_entity.dart';
import 'package:appaguaentregados/app/features/checked/domain/repository/ichecked_repository.dart';
import 'package:dartz/dartz.dart';

class GetQuantidadeAtualUseCase {
  final CheckedRepositoryImpl repository;

  GetQuantidadeAtualUseCase({
    required this.repository,
  });

  Future<Either<Failure, List<CheckedEntity>>> call() async {
    return await repository.getQuantidadeAtual();
  }
}
