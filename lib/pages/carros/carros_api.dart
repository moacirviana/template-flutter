import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:zyota/domains/carros.dart';
import 'package:zyota/domains/server_api.dart';

class TipoCarro {
  static const String classicos = "classicos";
  static const String esportivos = "esportivos";
  static const String luxo = "luxo";
}

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipoCarro) async {
    try {
      var url = Uri.https(ApiServer.domain,
          '${ApiServer.url}/carros/tipo/${tipoCarro.toLowerCase()}');
      //Map<String, String> headers = {"Content-Type": "application/json"};
      //var response = await http.get(url, headers: headers);
      var response = await http.get(url);
      //debugPrint(json);
      List list = convert.json.decode(response.body);

      final lstCarros = list.map<Carro>((e) => Carro.fromJson(e)).toList();
      return lstCarros;
      //await Future.delayed(const Duration(seconds: 2));
    } catch (e) {
      debugPrint(e.toString());
      debugPrint(tipoCarro);
      return [];
    }
  }
}


 /* mock
    carros.add(Carro(
        nome: 'AUDI GT Spyder',
        urlFoto:
            "https://mediacloud.carbuyer.co.uk/image/private/s--BWmuaeBo--/f_auto,t_content-image-full-mobile@1/v1579632313/carbuyer/2018/10/cf083147_0009s_0001_09.jpg"));
    carros.add(Carro(
        nome: 'Porsche Panamera',
        urlFoto:
            "https://avatars.mds.yandex.net/i?id=b81cecc36c5628a17cd101f55fc72c5e05efa259-7001681-images-thumbs&n=13"));
    carros.add(Carro(
        nome: 'Lamborghini Aventador',
        urlFoto:
            "https://avatars.mds.yandex.net/i?id=06e5dbe7b856a97d7b59d202bc7613f1-5215259-images-thumbs&n=13"));
    */