import 'dart:async';
import 'package:zyota/domains/usuario.dart';
import 'package:zyota/pages/api_response.dart';
import 'package:zyota/pages/login/login_api.dart';
import 'package:zyota/utils/stream_bloc.dart';

class LoginBloc extends StreamBloc<bool> {
  Future<ApiResponse<Usuario>> login(String login, String senha) async {
    add(true);
    ApiResponse<Usuario> response = await LoginApi.login(login, senha);
    add(false);
    return response;
  }
}

/*
// Para usar duas ou mais streams usar composição
class LoginBlocComposicao {
  final buttonBloc = StreamBloc<bool>();

  Future<ApiResponse<Usuario>> login(String login, String senha) async {
    buttonBloc.add(true);
    ApiResponse<Usuario> response = await LoginApi.login(login, senha);
    buttonBloc.add(false);
    return response;
  }

  // usando composição precisa delegar
  void dispose() {
    buttonBloc.dispose();
  }
}
*/
