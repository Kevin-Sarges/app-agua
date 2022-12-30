import 'package:appaguaentregados/app/common/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CheckedRepositoryImpl {
  Future<Either<Failure, void>> updateEstoque(int novoValor);
}
