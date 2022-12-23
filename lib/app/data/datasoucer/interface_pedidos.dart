import 'package:appaguaentregados/app/data/model/model_pedidos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IDbFirebase {
  Stream<QuerySnapshot<Map<String, dynamic>>> quantidadeEstoue();
  Future<void> encomendaAgua(ModelPedidos pedido);
  Future<void> atualizarEstoque(int novoValor);
}
