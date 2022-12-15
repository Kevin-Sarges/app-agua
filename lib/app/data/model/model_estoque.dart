import 'package:appaguaentregados/app/domain/entity/entities_estoque.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ModelEstoque extends EntitiesEstoque {
  ModelEstoque({
    required int quantidade,
  }) : super(
          quantidade: quantidade,
        );

  factory ModelEstoque.fromJson(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return ModelEstoque(
      quantidade: data['quantidade'] as int,
    );
  }
}
