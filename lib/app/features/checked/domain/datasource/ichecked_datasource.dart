import 'package:appaguaentregados/app/features/checked/domain/entyity/checked_entity.dart';

abstract class CheckedDataSourceImpl {
  Future<void> updateEstoque(int novoValor);
  Future<List<CheckedEntity>> getQuantidadeAtual();
}
