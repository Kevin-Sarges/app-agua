import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IDbFirebase {
  Stream<QuerySnapshot<Map<String, dynamic>>> quantidadeEstoue();
  Future<void> encomendaAgua(
    String nome,
    String telefone,
    double lat,
    double lon,
  );
  Future<void> salvandoLatLon(double lat, double lon);
}
