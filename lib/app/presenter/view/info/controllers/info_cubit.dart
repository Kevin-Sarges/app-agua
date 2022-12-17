import 'package:appaguaentregados/app/data/datasoucer/dbfirbase_interface.dart';
import 'package:appaguaentregados/app/presenter/view/info/controllers/info_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoCubit extends Cubit<InfoState> {
  InfoCubit(this.service) : super(InfoInitial());

  final IDbFirebase service;

  Future<void> salvarContato(
    String nome,
    String telefone,
    double lat,
    double lon,
  ) async {
    emit(InfoLoading());

    try {
      await service.encomendaAgua(nome, telefone, lat, lon);

      emit(InfoSucess());
    } catch (e) {
      emit(
        InfoError(e.toString()),
      );
    }
  }
}
