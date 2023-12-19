import 'dart:async';
import 'package:zyota/pages/carros/carros_api.dart';
import 'package:zyota/domains/carros.dart';

class CarrosBloc {
  final _streamController = StreamController<List<Carro>>();

  Stream<List<Carro>> get stream => _streamController.stream;

  findAll(String tipo) async {
    try {
      List<Carro> lstCarros = await CarrosApi.getCarros(tipo);
      _streamController.add(lstCarros);
    } catch (e) {
      _streamController.addError(e);
    }
  }

  void dispose() {
    _streamController.close();
  }
}
