import 'package:appaguaentregados/app/domain/entity/entities_pedidos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ModelPedidos extends EntitiesPedidos {
  ModelPedidos({
    required String nomeCliente,
    required String telefone,
    required double lat,
    required double lon,
    required bool finalizado,
    required String hora,
    required String tipoPagamento,
    required String tipoEntrega,
  }) : super(
          nomeCliente: nomeCliente,
          telefone: telefone,
          lat: lat,
          lon: lon,
          finalizado: finalizado,
          hora: hora,
          tipoEntrega: tipoEntrega,
          tipoPagamento: tipoPagamento,
        );

  factory ModelPedidos.fronJson(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return ModelPedidos(
      nomeCliente: data['nomeCliente'] as String,
      telefone: data['telefone'] as String,
      lat: data['lat'] as double,
      lon: data['lon'] as double,
      finalizado: data['finalizado'] ?? false,
      hora: data['hora'] as String,
      tipoEntrega: data['tipoEntrega'] as String,
      tipoPagamento: data['tipoPagamento'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final data = {
      'nomeCliente': nomeCliente,
      'telefone': telefone,
      'lat': lat,
      'lon': lon,
      'finalizado': finalizado,
      'hora': hora,
      'tipoEntrega': tipoEntrega,
      'tipoPagamento': tipoPagamento,
    };

    return data;
  }
}
