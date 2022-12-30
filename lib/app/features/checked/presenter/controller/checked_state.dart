import 'package:appaguaentregados/app/common/error/failure.dart';

abstract class CheckedState {}

class CheckedInitial extends CheckedState {}

class CheckedLoading extends CheckedState {}

class CheckedSucess extends CheckedState {}

class CheckedError extends CheckedState {
  Failure message;

  CheckedError(this.message);
}
