import 'package:appaguaentregados/app/data/datasoucer/interface_pedidos.dart';
import 'package:appaguaentregados/app/data/model/model_pedidos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceFirebase implements IDbFirebase {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<void> encomendaAgua(ModelPedidos pedido) {
    final data = db.collection('entregas').add(pedido.toJson());

    return data;
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> quantidadeEstoue() {
    final estoque = db.collection('estoque').snapshots();

    return estoque;
  }

  @override
  Future<void> atualizarEstoque(int novoValor) {
    final upgrade = db.collection('estoque').doc('Uc5ejpQmrIPAb0RCkznx').update(
      {
        'quantidade': novoValor,
      },
    );

    return upgrade;
  }
}
