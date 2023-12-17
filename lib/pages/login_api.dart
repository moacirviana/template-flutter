import 'dart:convert' as convert;
import 'package:zyota/utils/api_response.dart';
import 'package:zyota/domains/usuario.dart';
import 'package:http/http.dart' as http;


class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try {
      var url = Uri.https('carros-springboot.herokuapp.com', 'api/v2/login');

      Map params = {"username": login, "password": senha};

      Map<String, String> headers = {"Content-Type": "application/json"};

      var response =
          await http.post(url, body: convert.json.encode(params), headers: headers);

      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200) {
        final user = Usuario.fromJson(jsonResponse);
        user.save();
        return ApiResponse.ok(user);
        //return Future<bool>.value(true);
      }
      return ApiResponse.error(jsonResponse["error"]);
    } catch (error) {
      return ApiResponse.error("Não foi possível fazer o login!");
    }
  }
}
