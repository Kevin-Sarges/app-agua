import 'package:appaguaentregados/app/features/info/data/datasource/info_datasource.dart';
import 'package:appaguaentregados/app/features/info/data/repository/info_repository.dart';
import 'package:appaguaentregados/app/features/info/domain/datasource/iinfo_datasource.dart';
import 'package:appaguaentregados/app/features/info/domain/repository/iinfo_repository.dart';
import 'package:appaguaentregados/app/features/info/domain/usecase/add_info_usecase.dart';
import 'package:appaguaentregados/app/features/info/presenter/controllers/info_cubit.dart';
import 'package:get_it/get_it.dart';

class InfoInjectDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<InfoDataSourceImpl>(
      () => InfoDataSource(),
    );

    getIt.registerFactory<InfoRepositoryImpl>(
      () => InfoRepository(dataSource: getIt()),
    );

    getIt.registerFactory<AddInfoUseCase>(
      () => AddInfoUseCase(repository: getIt()),
    );

    getIt.registerFactory<InfoCubit>(
      () => InfoCubit(addInfoUseCase: getIt()),
    );
  }
}
