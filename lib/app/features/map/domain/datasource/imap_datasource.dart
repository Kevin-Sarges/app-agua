import 'package:geolocator/geolocator.dart';

abstract class MapDataSourceImpl {
  Future<Position> getLocal();
}
