// import 'package:appaguaentregados/app/data/datasoucer/map_position_interface.dart';
// import 'package:appaguaentregados/app/features/map/controllers/map_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:appaguaentregados/app/features/map/domain/usecase/get_local_usercase.dart';
import 'package:appaguaentregados/app/features/map/presenter/controllers/map_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit({required this.getLocalUserCase}) : super(MapInitial());

  final GetLocalUserCase getLocalUserCase;

  Future<void> getLocation() async {
    emit(MapLoading());

    final result = await getLocalUserCase();

    emit(result.fold(
      (erro) => MapError(erro),
      (sucess) => MapSucess(
        sucess.latitude,
        sucess.longitude,
      ),
    ));
  }
}
