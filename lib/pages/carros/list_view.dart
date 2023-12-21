import 'package:flutter/material.dart';
import 'package:zyota/domains/carros.dart';
import 'package:zyota/pages/carros/carros_detalhes.dart';
import 'package:zyota/utils/nav.dart';

class CarroListView extends StatelessWidget {
  final List<Carro> carros;
  const CarroListView(this.carros, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: ListView.builder(
        itemCount: carros.length,
        itemBuilder: (context, index) {
          Carro c = carros[index];
          return Card(
            color: Colors.grey[100],
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                        c.urlFoto ??
                            "https://e7.pngegg.com/pngimages/462/631/png-clipart-sports-car-black-and-white-car-compact-car-car-accident-thumbnail.png",
                        width: 250, errorBuilder: (BuildContext context,
                            Object exception, StackTrace? stackTrace) {
                      return const Text('😢 image not found');
                    }),
                  ),
                  Text(
                    c.nome!,
                    maxLines: 1,
                    overflow: TextOverflow
                        .ellipsis, // cria o 3pontinhos no final da linha caso nome não couber
                    style: const TextStyle(fontSize: 22),
                  ),
                  const Text(
                    "Descricao...",
                    style: TextStyle(fontSize: 16),
                  ),
                  ButtonBarTheme(
                    data: ButtonBarTheme.of(context),
                    child: ButtonBar(
                      children: <Widget>[
                        TextButton(
                          child: const Text('DETALHES'),
                          onPressed: () => _onClickDetalhes(context, c),
                        ),
                        TextButton(
                          child: const Text('SHARE'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _onClickDetalhes(context, Carro c) {
    push(context, CarrosDetalhes(c));
  }
}
