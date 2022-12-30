import 'package:appaguaentregados/app/features/home/domain/inject/home_inject.dart';
import 'package:appaguaentregados/app/features/info/domain/inject/info_Inject.dart';
import 'package:get_it/get_it.dart';

class InjectDependency {
  static void init() {
    final getIt = GetIt.instance;

    HomeInjectDependency.init(getIt);
    InfoInjectDependency.init(getIt);
  }
}
