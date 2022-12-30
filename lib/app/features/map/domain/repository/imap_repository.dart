import 'package:appaguaentregados/app/common/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

abstract class MapRepositoryImpl {
  Future<Either<Failure, Position>> getLocal();
}
