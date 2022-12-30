import 'package:appaguaentregados/app/common/error/common_errors.dart';
import 'package:appaguaentregados/app/features/map/domain/datasource/imap_datasource.dart';
import 'package:geolocator/geolocator.dart';

class MapDataSource implements MapDataSourceImpl {
  @override
  Future<Position> getLocal() async {
    try {
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
    } on PositionUpdateException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }
}
