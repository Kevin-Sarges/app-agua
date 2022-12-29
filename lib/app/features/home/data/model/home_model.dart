import 'package:appaguaentregados/app/features/home/domain/entity/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel({
    required int quantidade,
  }) : super(
          quantidade: quantidade,
        );

  factory HomeModel.formJson(Map<String, dynamic> json) {
    return HomeModel(
      quantidade: json['quantidade'],
    );
  }
}
