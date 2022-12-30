import 'package:appaguaentregados/app/features/map/domain/entity/map_entity.dart';

class MapModel extends MapEntity {
  MapModel({
    required double lat,
    required double lon,
  }) : super(
          lat: lat,
          lon: lon,
        );

  factory MapModel.fromJson(Map<String, dynamic> json) {
    return MapModel(
      lat: json['lat'] as double,
      lon: json['lon'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    final data = {
      'lat': lat,
      'lon': lon,
    };

    return data;
  }
}
