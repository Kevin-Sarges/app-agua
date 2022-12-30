import 'package:appaguaentregados/app/common/error/failure.dart';
import 'package:appaguaentregados/app/features/home/domain/entity/home_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSucess extends HomeState {
  List<HomeEntity> quantidade;

  HomeSucess(this.quantidade);
}

class HomeErro extends HomeState {
  final Failure erro;

  HomeErro(this.erro);
}
