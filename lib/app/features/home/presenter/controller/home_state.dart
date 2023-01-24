import 'package:appaguaentregados/app/common/error/failure.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSucess extends HomeState {}

class HomeErro extends HomeState {
  final Failure erro;

  HomeErro(this.erro);
}
