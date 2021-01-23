part of 'userbloc_bloc.dart';

// @immutable
// abstract class UserblocEvent {}

class UserblocEvent extends Equatable {
  @override
  List<Object> get props => null;
}

class GetUserDetailFromAPI extends UserblocEvent {
  final int page;

  GetUserDetailFromAPI({this.page});

  @override
  List<Object> get props => [page];
}

