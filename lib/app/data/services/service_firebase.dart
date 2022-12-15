import 'package:appaguaentregados/app/data/datasoucer/dbfirbase_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceFirebase implements IDbFirebase {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<void> encomendaAgua(
    String nome,
    String telefone,
    double lat,
    double lon,
  ) {
    final pedido = {
      'nome': nome,
      'telefone': telefone,
      'lat': lat,
      'lon': lon,
      'finalizado': false,
    };

    final data = db.collection('entregas').add(pedido);

    return data;
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> quantidadeEstoue() {
    final estoque = db.collection('estoque').snapshots();

    return estoque;
  }
}
