import 'package:appaguaentregados/app/features/info/data/model/info_model.dart';

abstract class InfoDataSourceImpl {
  Future<void> addInfo(InfoModel pedido);
}
