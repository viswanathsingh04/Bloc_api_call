import 'package:bloc_api/models/userdata.dart';
import 'package:bloc_api/utility/utils.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<UserData> getuserdata(int page) async {
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
