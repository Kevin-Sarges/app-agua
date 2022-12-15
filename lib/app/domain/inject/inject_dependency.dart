import 'package:appaguaentregados/app/presenter/view/home/inject/home_inject.dart';
import 'package:get_it/get_it.dart';

class InjectDependency {
  static void init() {
    final getIt = GetIt.instance;

    InjectDependencyHome.init(getIt);
  }
}
