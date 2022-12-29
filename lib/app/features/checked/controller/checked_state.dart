abstract class CheckedState {}

class CheckedInitial extends CheckedState {}

class CheckedLoading extends CheckedState {}

class CheckedSucess extends CheckedState {}

class CheckedError extends CheckedState {
  String message;

  CheckedError(this.message);
}
