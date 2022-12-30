import 'package:appaguaentregados/app/common/error/failure.dart';
import 'package:appaguaentregados/app/features/checked/domain/entyity/checked_entity.dart';

abstract class CheckedState {}

class CheckedInitial extends CheckedState {}

class CheckedLoading extends CheckedState {}

class CheckedSucess extends CheckedState {
  List<CheckedEntity> quantidade;

  CheckedSucess(this.quantidade);
}

class CheckedError extends CheckedState {
  Failure message;

  CheckedError(this.message);
}
