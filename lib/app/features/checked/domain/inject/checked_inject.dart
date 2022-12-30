import 'package:appaguaentregados/app/features/checked/data/datasource/checked_datasource.dart';
import 'package:appaguaentregados/app/features/checked/data/repository/checked_repository.dart';
import 'package:appaguaentregados/app/features/checked/domain/datasource/ichecked_datasource.dart';
import 'package:appaguaentregados/app/features/checked/domain/repository/ichecked_repository.dart';
import 'package:appaguaentregados/app/features/checked/domain/usecase/update_estoque_usecase.dart';
import 'package:appaguaentregados/app/features/checked/presenter/controller/checked_cubit.dart';
import 'package:get_it/get_it.dart';

class CheckedInjectDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<CheckedDataSourceImpl>(
      () => CheckedDataSource(),
    );

    getIt.registerFactory<CheckedRepositoryImpl>(
      () => CheckedRepository(dataSource: getIt()),
    );

    getIt.registerFactory<UpdateEstoqueUseCase>(
      () => UpdateEstoqueUseCase(repository: getIt()),
    );

    getIt.registerFactory<CheckedCubit>(
      () => CheckedCubit(updateEstoque: getIt()),
    );
  }
}
