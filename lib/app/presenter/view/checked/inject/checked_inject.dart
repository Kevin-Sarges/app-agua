import 'package:appaguaentregados/app/presenter/view/checked/controller/checked_cubit.dart';
import 'package:get_it/get_it.dart';

class InjectDependencyChecked {
  static void init(GetIt getIt) {
    getIt.registerFactory<CheckedCubit>(
      () => CheckedCubit(getIt()),
    );
  }
}
