import 'package:appaguaentregados/app/data/datasoucer/map_position_interface.dart';
import 'package:geolocator/geolocator.dart';

class ServiceGoogleMaps implements IMapPosition {
  @override
  Future<Position> userPosition() async {
    final permission = await Geolocator.checkPermission();
    final request = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied &&
        request == LocationPermission.denied) {
      return Future.error('Você precisa autorizar o acesso á localização !!');
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Você precisa autorizar o acesso á localização !!');
    }

    final local = await Geolocator.getCurrentPosition();

    return local;
  }
}
