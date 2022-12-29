abstract class InfoState {}

class InfoInitial extends InfoState {}

class InfoLoading extends InfoState {}

class InfoSucess extends InfoState {}

class InfoError extends InfoState {
  String message;

  InfoError(this.message);
}
