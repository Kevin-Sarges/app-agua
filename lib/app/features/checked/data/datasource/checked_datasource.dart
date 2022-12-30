import 'package:appaguaentregados/app/common/error/common_errors.dart';
import 'package:appaguaentregados/app/features/checked/domain/datasource/ichecked_datasource.dart';
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
}
