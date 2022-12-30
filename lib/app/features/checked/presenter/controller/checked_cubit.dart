// import 'package:appaguaentregados/app/data/datasoucer/interface_pedidos.dart';
// import 'package:appaguaentregados/app/data/services/service_firebase.dart';
// import 'package:appaguaentregados/app/features/checked/controller/checked_state.dart';
import 'package:appaguaentregados/app/features/checked/domain/usecase/update_estoque_usecase.dart';
import 'package:appaguaentregados/app/features/checked/presenter/controller/checked_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckedCubit extends Cubit<CheckedState> {
  CheckedCubit({required this.updateEstoque}) : super(CheckedInitial());

  final UpdateEstoqueUseCase updateEstoque;

  Future<void> update(int novoValor) async {
    emit(CheckedLoading());

    final result = await updateEstoque(novoValor);

    emit(result.fold(
      (erro) => CheckedError(erro),
      (sucess) => CheckedSucess(),
    ));
  }
}
