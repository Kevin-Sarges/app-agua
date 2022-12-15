import 'package:appaguaentregados/app/data/datasoucer/dbfirbase_interface.dart';
import 'package:appaguaentregados/app/data/services/service_firebase.dart';
import 'package:appaguaentregados/app/presenter/view/home/controller/home_cubit.dart';
import 'package:get_it/get_it.dart';

class InjectDependencyHome {
  static void init(GetIt getIt) {
    getIt.registerSingleton<IDbFirebase>(
      ServiceFirebase(),
    );

    getIt.registerFactory<HomeCubit>(
      () => HomeCubit(getIt()),
    );
  }
}
