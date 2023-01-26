import 'package:appaguaentregados/app/features/home/domain/entity/home_entity.dart';
import 'package:appaguaentregados/app/features/home/domain/usecase/get_quantidade_usecase.dart';
import 'package:appaguaentregados/app/features/home/presenter/controller/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.getQuantidadeUseCase}) : super(HomeInitial());

  final GetQuantidadeUseCase getQuantidadeUseCase;

  Stream<List<HomeEntity>> quantidadeEstoque() async* {
    emit(HomeLoading());

    final result = await getQuantidadeUseCase();

    emit(result.fold(
      (failure) => HomeErro(failure),
      (sucess) => HomeSucess(sucess),
    ));
  }
}
