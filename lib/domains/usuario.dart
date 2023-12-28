import 'package:flutter/foundation.dart';
import 'package:zyota/utils/prefers_user.dart';
import 'dart:convert' as convert;

class Usuario {
  String? login;
  String? nome;
  String? urlFoto;
  String? email;
  String? token;
  List<String>? roles;

  //lista de inicialização
  Usuario.fromJson(Map<String, dynamic> map)
      : nome = map["nome"],
        email = map["email"],
        urlFoto = map["urlFoto"],
        token = map["token"],
        roles = (map["roles"] != null)
            ? map["roles"].map<String>((role) => role.toString()).toList()
            : null,
        login = map["login"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['nome'] = nome;
    data['email'] = email;
    data['urlFoto'] = urlFoto;
    data['token'] = token;
    data['roles'] = roles;
    return data;
  }

  static void clear() {
    Prefs.setString("user.prefs", "");
  }

  void save() {
    Map map = toJson();
    String json = convert.json.encode(map);
    Prefs.setString("user.prefs", json);
  }

  static Future<Usuario> get() async {
    Usuario? usuario;
    try {
      String json = await Prefs.getString("user.prefs");
      if (json.isEmpty) {
        return usuario!;
      }
      Map<String, dynamic> map = convert.json.decode(json);
      usuario = Usuario.fromJson(map);
    } catch (e) {
      debugPrint(e.toString());
    }

    return usuario!;
  }

  @override
  String toString() {
    return 'Usuario {login: $login , nome: $nome , roles: $roles}';
  }
}
