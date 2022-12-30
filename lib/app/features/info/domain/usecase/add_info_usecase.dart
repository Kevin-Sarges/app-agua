import 'package:appaguaentregados/app/common/error/failure.dart';
import 'package:appaguaentregados/app/features/info/data/model/info_model.dart';
import 'package:appaguaentregados/app/features/info/domain/repository/iinfo_repository.dart';
import 'package:dartz/dartz.dart';

class AddInfoUseCase {
  final InfoRepositoryImpl repository;

  AddInfoUseCase({
    required this.repository,
  });

  Future<Either<Failure, void>> call(InfoModel pedidos) async {
    return repository.addInfo(pedidos);
  }
}
