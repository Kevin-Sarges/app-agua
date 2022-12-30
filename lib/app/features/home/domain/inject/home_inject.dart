import 'package:appaguaentregados/app/features/home/data/datasource/home_datasource.dart';
import 'package:appaguaentregados/app/features/home/data/repository/home_repository.dart';
import 'package:appaguaentregados/app/features/home/domain/datasource/ihome_datasource.dart';
import 'package:appaguaentregados/app/features/home/domain/repository/ihome_repository.dart';
import 'package:appaguaentregados/app/features/home/domain/usecase/get_quantidade_usecase.dart';
import 'package:appaguaentregados/app/features/home/presenter/controller/home_cubit.dart';
import 'package:get_it/get_it.dart';

class HomeInjectDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<HomeDataSourceImpl>(
      () => HomeDataSource(),
    );

    getIt.registerFactory<HomeRepositoryImpl>(
      () => HomeRepository(dataSource: getIt()),
    );

    getIt.registerFactory<GetQuantidadeUseCase>(
      () => GetQuantidadeUseCase(repository: getIt()),
    );

    getIt.registerFactory<HomeCubit>(
      () => HomeCubit(getQuantidadeUseCase: getIt()),
    );
  }
}
