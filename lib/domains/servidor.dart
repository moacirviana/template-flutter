import 'dart:convert' as convert;

import 'package:zyota/utils/prefers_user.dart';

class Servidor {
  String? id;
  String? nome;
  String? tituloEleitor;
  String? numCpf;
  String? email;
  String? celular;
  String? dataDesligamento;

  Servidor(
      {this.id,
      this.nome,
      this.tituloEleitor,
      this.numCpf,
      this.email,
      this.celular,
      this.dataDesligamento});

  Servidor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    tituloEleitor = json['tituloEleitor'];
    numCpf = json['numCpf'];
    email = json['email'];
    celular = json['celular'];
    dataDesligamento = json['dataDesligamento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['tituloEleitor'] = tituloEleitor;
    data['numCpf'] = numCpf;
    data['email'] = email;
    data['celular'] = celular;
    data['dataDesligamento'] = dataDesligamento;
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

  static Future<Servidor> get() async {
    Servidor? servidor;
    String json = await Prefs.getString("user.prefs");
    if (json.isEmpty) {
      return servidor!;
    }
    Map<String, dynamic> map = convert.json.decode(json);
    servidor = Servidor.fromJson(map);
    return servidor;
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Servidor {matricula: $id , nome: $nome , tituloEleitor: $tituloEleitor}';
  }
}
