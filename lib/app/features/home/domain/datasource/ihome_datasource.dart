import 'package:appaguaentregados/app/features/home/domain/entity/home_entity.dart';

abstract class HomeDataSourceImpl {
  Stream<List<HomeEntity>> getQuantidade();
}
