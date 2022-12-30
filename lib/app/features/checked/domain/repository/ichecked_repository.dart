import 'package:appaguaentregados/app/common/error/failure.dart';
import 'package:appaguaentregados/app/features/checked/domain/entyity/checked_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CheckedRepositoryImpl {
  Future<Either<Failure, void>> updateEstoque(int novoValor);
  Future<Either<Failure, List<CheckedEntity>>> getQuantidadeAtual();
}
