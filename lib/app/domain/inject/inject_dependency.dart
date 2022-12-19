import 'package:appaguaentregados/app/data/datasoucer/dbfirbase_interface.dart';
import 'package:appaguaentregados/app/data/services/service_firebase.dart';
import 'package:appaguaentregados/app/presenter/view/home/inject/home_inject.dart';
import 'package:appaguaentregados/app/presenter/view/info/inject/info_Inject.dart';
import 'package:appaguaentregados/app/presenter/view/map/inject/map_inject.dart';
import 'package:get_it/get_it.dart';

class InjectDependency {
  static void init() {
    final getIt = GetIt.instance;

    getIt.registerSingleton<IDbFirebase>(
      ServiceFirebase(),
    );

    InjectDependencyHome.init(getIt);
    InjectDependencyInfo.init(getIt);
    InjectDependencyMap.init(getIt);
  }
}
