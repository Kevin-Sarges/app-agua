import 'package:geolocator/geolocator.dart';

abstract class IMapPosition {
  Future<Position> userPosition();
}
