import 'package:appaguaentregados/app/data/datasoucer/interface_pedidos.dart';
import 'package:appaguaentregados/app/data/services/service_firebase.dart';
import 'package:appaguaentregados/app/presenter/view/home/controller/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.service) : super(HomeInitial());

  final IDbFirebase service;
  final estoque = ServiceFirebase().quantidadeEstoue();

  Future<void> quantidadeEstoque() async {
    emit(HomeLoading());

    try {
      final quantidade = service.quantidadeEstoue();

      emit(HomeSucess(quantidade));
    } catch (e) {
      emit(
        HomeErro(e.toString()),
      );
    }
  }
}
