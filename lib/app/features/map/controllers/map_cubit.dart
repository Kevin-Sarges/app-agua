// import 'package:appaguaentregados/app/data/datasoucer/map_position_interface.dart';
// import 'package:appaguaentregados/app/features/map/controllers/map_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class MapCubit extends Cubit<MapState> {
//   MapCubit(this.map) : super(MapInitial());

//   final IMapPosition map;

//   Future<void> getLocation() async {
//     emit(MapLoading());

//     try {
//       final local = await map.userPosition();

//       emit(
//         MapSucess(
//           local.latitude,
//           local.longitude,
//         ),
//       );
//     } catch (e) {
//       emit(
//         MapError(e.toString()),
//       );
//     }
//   }
// }
