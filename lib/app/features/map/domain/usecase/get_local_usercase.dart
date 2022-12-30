import 'package:appaguaentregados/app/common/error/failure.dart';
import 'package:appaguaentregados/app/features/map/domain/repository/imap_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

class GetLocalUserCase {
  final MapRepositoryImpl repository;

  GetLocalUserCase({
    required this.repository,
  });

  Future<Either<Failure, Position>> call() async {
    return await repository.getLocal();
  }
}
