// import 'package:appaguaentregados/app/data/datasoucer/interface_pedidos.dart';
// import 'package:appaguaentregados/app/data/services/service_firebase.dart';
// import 'package:appaguaentregados/app/features/checked/controller/checked_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CheckedCubit extends Cubit<CheckedState> {
//   CheckedCubit(this.service) : super(CheckedInitial());

//   final IDbFirebase service;
//   final estoque = ServiceFirebase().quantidadeEstoue();

//   Future<void> quantidadeEstoque() async {
//     emit(CheckedLoading());

//     try {
//       service.quantidadeEstoue();

//       emit(CheckedSucess());
//     } catch (e) {
//       emit(
//         CheckedError(e.toString()),
//       );
//     }
//   }

//   Future<void> novoValorEstoque(int novoValor) async {
//     emit(CheckedLoading());

//     try {
//       await service.atualizarEstoque(novoValor);
//       emit(CheckedSucess());
//     } catch (e) {
//       emit(
//         CheckedError(e.toString()),
//       );
//     }
//   }
// }
