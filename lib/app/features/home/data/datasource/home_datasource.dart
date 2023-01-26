import 'package:appaguaentregados/app/common/error/common_errors.dart';
import 'package:appaguaentregados/app/features/home/data/model/home_model.dart';
import 'package:appaguaentregados/app/features/home/domain/datasource/ihome_datasource.dart';
import 'package:appaguaentregados/app/features/home/domain/entity/home_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeDataSource implements HomeDataSourceImpl {
  @override
  Stream<List<HomeEntity>> getQuantidade() {
    final db = FirebaseFirestore.instance;

    try {
      final data = db.collection('estoque').snapshots();

      final result = data.map((event) {
        final docs = event.docs;

        return docs.map((doc) {
          final data = doc.data();

          return HomeModel(
            quantidade: data['quantidade'],
          );
        }).toList();
      });

      return result;
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }
}
