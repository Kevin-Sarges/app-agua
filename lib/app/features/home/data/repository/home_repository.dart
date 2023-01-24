import 'package:appaguaentregados/app/features/home/domain/datasource/ihome_datasource.dart';
import 'package:appaguaentregados/app/common/error/failure.dart';
import 'package:appaguaentregados/app/features/home/domain/entity/home_entity.dart';
import 'package:appaguaentregados/app/features/home/domain/repository/ihome_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepository implements HomeRepositoryImpl {
  final HomeDataSourceImpl dataSource;

  HomeRepository({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, Stream<List<HomeEntity>>>> getQuantidade() async {
    try {
      final result = dataSource.getQuantidade();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
