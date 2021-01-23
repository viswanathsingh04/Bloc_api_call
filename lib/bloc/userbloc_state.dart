part of 'userbloc_bloc.dart';

// @immutable
// abstract class UserblocState extends Equatable{}

class UserblocInitial extends UserblocState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class UserblocState extends Equatable {
  @override
  List<Object> get props => null;
}

class NotLoadingState extends UserblocState {}

class LoadingState extends UserblocState {}

class LoadedState extends UserblocState {
  final UserData userData;

  LoadedState(this.userData);

  @override
  List<Object> get props => [userData];
}
