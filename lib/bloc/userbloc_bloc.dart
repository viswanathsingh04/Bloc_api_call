import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_api/models/userdata.dart';
import 'package:bloc_api/utility/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'userbloc_event.dart';
part 'userbloc_state.dart';

class UserblocBloc extends Bloc<UserblocEvent, UserblocState> {
  UserData userData;
  //ApiServices _apiServices;
  UserblocBloc() : super(UserblocInitial());

  @override
  Stream<UserblocState> mapEventToState(
    UserblocEvent event,
  ) async* {
    if (event is GetUserDetailFromAPI) {
      yield LoadingState();
      try {
        userData = await getuserdata(event.page);
        yield LoadedState(userData);
      } catch (e) {
        print(e);
      }
    }
  }

  Future<UserData> getuserdata(int page) async {
    page = 1;
    var url = Utils().BASEURL + Utils().USER + page.toString();
    //print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      //print(response.body);
      return userDataFromJson(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
