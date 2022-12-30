import 'package:appaguaentregados/app/features/checked/domain/usecase/get_quantidade_atual_usecase.dart';
import 'package:appaguaentregados/app/features/checked/domain/usecase/update_estoque_usecase.dart';
import 'package:appaguaentregados/app/features/checked/presenter/controller/checked_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckedCubit extends Cubit<CheckedState> {
  CheckedCubit({
    required this.updateEstoque,
    required this.getQuantidadeAtual,
  }) : super(CheckedInitial());

  final UpdateEstoqueUseCase updateEstoque;
  final GetQuantidadeAtualUseCase getQuantidadeAtual;

  Future<void> update(int novoValor) async {
    emit(CheckedLoading());

    await updateEstoque(novoValor);
  }

  Future<void> getQnt() async {
    emit(CheckedLoading());

    final result = await getQuantidadeAtual();

    emit(result.fold(
      (erro) => CheckedError(erro),
      (sucess) => CheckedSucess(sucess),
    ));
  }
}
