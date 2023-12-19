import 'package:flutter/material.dart';
import 'package:zyota/domains/carros.dart';

class CarrosDetalhes extends StatelessWidget {
  final Carro carro;

  const CarrosDetalhes(this.carro, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome!),
      ),
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Text(carro.descricao!),
    );
  }
}
