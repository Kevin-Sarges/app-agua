import 'package:appaguaentregados/app/features/info/domain/entity/info_entity.dart';

class InfoModel extends InfoEntity {
  InfoModel({
    required String nomeCliente,
    required String telefone,
    required double lat,
    required double lon,
    required bool finalizado,
    required String hora,
    required String tipoEntrega,
    required String tipoPagamento,
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

  factory InfoModel.fromJosn(Map<String, dynamic> json) {
    return InfoModel(
      nomeCliente: json['nomeCliente'] as String,
      telefone: json['telefone'] as String,
      lat: json['lat'] as double,
      lon: json['lon'] as double,
      finalizado: json['finalizado'] ?? false,
      hora: json['hora'] as String,
      tipoEntrega: json['tipoEntrega'] as String,
      tipoPagamento: json['tipoPagamento'] as String,
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
