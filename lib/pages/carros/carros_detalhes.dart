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
    return Container(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          children: [
            Center(
              child: Image.network(
                  carro.urlFoto ??
                      "https://e7.pngegg.com/pngimages/462/631/png-clipart-sports-car-black-and-white-car-compact-car-car-accident-thumbnail.png",
                  width: 350, errorBuilder: (BuildContext context,
                      Object exception, StackTrace? stackTrace) {
                return const Text('😢 image not found');
              }),
            ),
            Text(carro.descricao!),
          ],
        ),
      ),
    );
  }
}
