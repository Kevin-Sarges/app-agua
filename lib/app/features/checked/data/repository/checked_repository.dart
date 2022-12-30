import 'package:appaguaentregados/app/common/error/failure.dart';
import 'package:appaguaentregados/app/features/checked/domain/datasource/ichecked_datasource.dart';
import 'package:appaguaentregados/app/features/checked/domain/repository/ichecked_repository.dart';
import 'package:dartz/dartz.dart';

class CheckedRepository implements CheckedRepositoryImpl {
  final CheckedDataSourceImpl dataSource;

  CheckedRepository({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, void>> updateEstoque(int novoValor) async {
    try {
      final result = await dataSource.updateEstoque(novoValor);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
