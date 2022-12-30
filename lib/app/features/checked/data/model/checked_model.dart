import 'package:appaguaentregados/app/features/checked/domain/entyity/checked_entity.dart';

class CheckedModel extends CheckedEntity {
  CheckedModel({required int quantidade}) : super(quantidade: quantidade);

  factory CheckedModel.fromJson(Map<String, dynamic> json) {
    return CheckedModel(quantidade: json['quantidade'] as int);
  }

  Map<String, dynamic> toJson() {
    final data = {
      'quantidade': quantidade,
    };

    return data;
  }
}
