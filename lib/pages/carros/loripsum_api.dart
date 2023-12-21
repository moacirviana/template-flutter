import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zyota/utils/stream_bloc.dart';
import 'package:http/http.dart' as http;

class LoripsumBloc extends StreamBloc<String> {
  static String? lorim;
  fetch() async {
    String s = lorim ?? await LoripsumApi.getLoripsum();
    lorim = s;
    add(s);
  }
}

class LoripsumApi {
  static Future<String> getLoripsum() async {
    var url = Uri.https('loripsum.net', 'api');
    debugPrint("GET > $url");
    var response = await http.get(url);
    String text = response.body;
    text = text.replaceAll("<p>", "");
    text = text.replaceAll("</p>", "");
    return text;
  }
}

/*
class LoripsumBloc {
  final _streamController = StreamController<String>();
  Stream<String> get stream => _streamController.stream;
  fetch() async {
    String s = await LoripsumApi.getLoripsum();
    _streamController.add(s);
  }
  void dispose() {
    _streamController.close();
  }
} */


