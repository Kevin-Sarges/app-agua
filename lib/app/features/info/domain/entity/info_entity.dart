class InfoEntity {
  String nomeCliente;
  String telefone;
  double lat;
  double lon;
  bool finalizado;
  String hora;
  String tipoPagamento;
  String tipoEntrega;

  InfoEntity({
    required this.nomeCliente,
    required this.telefone,
    required this.lat,
    required this.lon,
    required this.finalizado,
    required this.hora,
    required this.tipoEntrega,
    required this.tipoPagamento,
  });
}
