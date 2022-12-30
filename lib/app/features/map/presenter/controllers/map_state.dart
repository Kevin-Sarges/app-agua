import 'package:appaguaentregados/app/common/error/failure.dart';

abstract class MapState {}

class MapInitial extends MapState {}

class MapLoading extends MapState {}

class MapSucess extends MapState {
  double lat;
  double lon;

  MapSucess(this.lat, this.lon);
}

class MapError extends MapState {
  Failure erro;

  MapError(this.erro);
}
