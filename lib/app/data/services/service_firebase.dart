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

  @override
  Future<void> salvandoLatLon(double lat, double lon) {
    final latLogAtt = {
      'lat': lat,
      'lon': lon,
    };

    final docId = db.collection('estoque').doc().id;

    final atualizarEstoque =
        db.collection('estoque').doc(docId).update(latLogAtt);

    return atualizarEstoque;
  }
}
