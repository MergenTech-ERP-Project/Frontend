import 'package:http/http.dart' as http;
import 'package:vtys_kalite/models/user.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<User>?> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'http://localhost:8080/user/users'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return userFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
