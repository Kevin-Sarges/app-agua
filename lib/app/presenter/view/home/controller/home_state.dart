import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSucess extends HomeState {
  Stream<QuerySnapshot<Map<String, dynamic>>> quantidade;

  HomeSucess(this.quantidade);
}

class HomeErro extends HomeState {
  String erro;

  HomeErro(this.erro);
}
