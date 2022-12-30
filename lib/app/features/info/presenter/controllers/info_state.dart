import 'package:appaguaentregados/app/common/error/failure.dart';

abstract class InfoState {}

class InfoInitial extends InfoState {}

class InfoLoading extends InfoState {}

class InfoSucess extends InfoState {}

class InfoError extends InfoState {
  Failure message;

  InfoError(this.message);
}
