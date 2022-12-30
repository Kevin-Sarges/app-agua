import 'package:appaguaentregados/app/common/error/failure.dart';
import 'package:appaguaentregados/app/features/checked/domain/repository/ichecked_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateEstoqueUseCase {
  final CheckedRepositoryImpl repository;

  UpdateEstoqueUseCase({
    required this.repository,
  });

  Future<Either<Failure, void>> call(int novoValor) async {
    return repository.updateEstoque(novoValor);
  }
}
