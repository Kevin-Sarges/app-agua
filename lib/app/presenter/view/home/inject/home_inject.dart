import 'package:appaguaentregados/app/presenter/view/home/controller/home_cubit.dart';
import 'package:get_it/get_it.dart';

class InjectDependencyHome {
  static void init(GetIt getIt) {
    getIt.registerFactory<HomeCubit>(
      () => HomeCubit(getIt()),
    );
  }
}
