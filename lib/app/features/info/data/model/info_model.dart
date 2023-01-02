import 'package:appaguaentregados/app/features/info/domain/entity/info_entity.dart';

class InfoModel extends InfoEntity {
  InfoModel({
    required super.nomeCliente,
    required super.telefone,
    required super.lat,
    required super.lon,
    required super.finalizado,
    required super.hora,
    required super.tipoEntrega,
    required super.tipoPagamento,
  });

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
