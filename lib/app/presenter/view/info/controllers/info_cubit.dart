import 'package:appaguaentregados/app/data/datasoucer/interface_pedidos.dart';
import 'package:appaguaentregados/app/data/model/model_pedidos.dart';
import 'package:appaguaentregados/app/presenter/view/info/controllers/info_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoCubit extends Cubit<InfoState> {
  InfoCubit(this.service) : super(InfoInitial());

  final IDbFirebase service;

  Future<void> salvarDadosUsuario(ModelPedidos pedidos) async {
    emit(InfoLoading());

    try {
      await service.encomendaAgua(pedidos);

      emit(InfoSucess());
    } catch (e) {
      emit(
        InfoError(e.toString()),
      );
    }
  }
}
