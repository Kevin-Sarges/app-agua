import 'package:appaguaentregados/app/common/error/common_errors.dart';
import 'package:appaguaentregados/app/features/info/data/model/info_model.dart';
import 'package:appaguaentregados/app/features/info/domain/datasource/iinfo_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InfoDataSource implements InfoDataSourceImpl {
  final db = FirebaseFirestore.instance;

  @override
  Future<void> addInfo(InfoModel pedido) {
    try {
      final data = db.collection('entregas').add(pedido.toJson());

      return data;
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }
}
