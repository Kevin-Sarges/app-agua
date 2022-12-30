import 'package:appaguaentregados/app/features/map/data/datasource/map_datasource.dart';
import 'package:appaguaentregados/app/features/map/data/repository/map_repository.dart';
import 'package:appaguaentregados/app/features/map/domain/datasource/imap_datasource.dart';
import 'package:appaguaentregados/app/features/map/domain/repository/imap_repository.dart';
import 'package:appaguaentregados/app/features/map/domain/usecase/get_local_usercase.dart';
import 'package:appaguaentregados/app/features/map/presenter/controllers/map_cubit.dart';
import 'package:get_it/get_it.dart';

class MapInjectDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<MapDataSourceImpl>(
      () => MapDataSource(),
    );

    getIt.registerFactory<MapRepositoryImpl>(
      () => MapRepository(dataSource: getIt()),
    );

    getIt.registerFactory<GetLocalUserCase>(
      () => GetLocalUserCase(repository: getIt()),
    );

    getIt.registerFactory<MapCubit>(
      () => MapCubit(getLocalUserCase: getIt()),
    );
  }
}
