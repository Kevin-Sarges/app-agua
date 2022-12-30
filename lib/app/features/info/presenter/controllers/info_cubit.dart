import 'package:appaguaentregados/app/features/info/data/model/info_model.dart';
import 'package:appaguaentregados/app/features/info/domain/usecase/add_info_usecase.dart';
import 'package:appaguaentregados/app/features/info/presenter/controllers/info_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoCubit extends Cubit<InfoState> {
  InfoCubit({required this.addInfoUseCase}) : super(InfoInitial());

  final AddInfoUseCase addInfoUseCase;

  Future<void> salvarDadosUsuario(InfoModel pedidos) async {
    emit(InfoLoading());

    final result = await addInfoUseCase(pedidos);

    emit(result.fold(
      (erro) => InfoError(erro),
      (sucess) => InfoSucess(),
    ));
  }
}
