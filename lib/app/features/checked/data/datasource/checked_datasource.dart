import 'package:appaguaentregados/app/common/error/common_errors.dart';
import 'package:appaguaentregados/app/features/checked/data/model/checked_model.dart';
import 'package:appaguaentregados/app/features/checked/domain/datasource/ichecked_datasource.dart';
import 'package:appaguaentregados/app/features/checked/domain/entyity/checked_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckedDataSource implements CheckedDataSourceImpl {
  final db = FirebaseFirestore.instance;

  @override
  Future<void> updateEstoque(int novoValor) {
    try {
      final update = db
          .collection('estoque')
          .doc('Uc5ejpQmrIPAb0RCkznx')
          .update({'quantidade': novoValor});

      return update;
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }

  @override
  Future<List<CheckedEntity>> getQuantidadeAtual() async {
    try {
      final get = await db.collection('estoque').get();

      final result = get.docs.map((doc) {
        final data = doc.data();

        return CheckedModel(
          quantidade: data['quantidade'],
        );
      }).toList();

      return result;
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }
}
