import 'package:appaguaentregados/app/common/error/failure.dart';
import 'package:appaguaentregados/app/features/map/domain/datasource/imap_datasource.dart';
import 'package:appaguaentregados/app/features/map/domain/repository/imap_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

class MapRepository implements MapRepositoryImpl {
  final MapDataSourceImpl dataSource;

  MapRepository({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, Position>> getLocal() async {
    try {
      final result = await dataSource.getLocal();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
