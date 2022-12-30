import 'package:appaguaentregados/app/common/error/failure.dart';
import 'package:appaguaentregados/app/features/info/data/model/info_model.dart';
import 'package:dartz/dartz.dart';

abstract class InfoRepositoryImpl {
  Future<Either<Failure, void>> addInfo(InfoModel pedido);
}
