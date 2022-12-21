import 'package:appaguaentregados/app/data/datasoucer/dbfirbase_interface.dart';
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
}
