import 'dart:async';
import 'package:zyota/domains/usuario.dart';
import 'package:zyota/pages/api_response.dart';
import 'package:zyota/pages/login/login_api.dart';

class LoginBloc {
  final _streamController = StreamController<bool>();

  Stream<bool> get buttonStream => _streamController.stream;

  Future<ApiResponse<Usuario>> login(String login, String senha) async {
    _streamController.add(true);
    ApiResponse<Usuario> response = await LoginApi.login(login, senha);
    _streamController.add(false);
    return response;
  }

  void dispose() {
    _streamController.close();
  }
}
