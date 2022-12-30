import 'package:appaguaentregados/app/features/info/data/model/info_model.dart';
import 'package:appaguaentregados/app/features/info/domain/datasource/iinfo_datasource.dart';
import 'package:appaguaentregados/app/common/error/failure.dart';
import 'package:appaguaentregados/app/features/info/domain/repository/iinfo_repository.dart';
import 'package:dartz/dartz.dart';

class InfoRepository implements InfoRepositoryImpl {
  final InfoDataSourceImpl dataSource;

  InfoRepository({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, void>> addInfo(InfoModel pedido) async {
    try {
      final result = await dataSource.addInfo(pedido);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
