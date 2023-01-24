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
  Stream<Either<Failure, List<HomeEntity>>> getQuantidade() async* {
    try {
      final result = await dataSource.getQuantidade();

      yield Right(result);
    } on Failure catch (e) {
      yield Left(e);
    }
  }
}
