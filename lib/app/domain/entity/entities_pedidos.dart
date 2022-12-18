class EntitiesPedidos {
  String nomeCliente;
  String telefone;
  double lat;
  double lon;
  bool finalizado;
  String hora;

  EntitiesPedidos({
    required this.nomeCliente,
    required this.telefone,
    required this.lat,
    required this.lon,
    required this.finalizado,
    required this.hora,
  });
}
