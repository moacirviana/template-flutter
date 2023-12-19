import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zyota/domains/carros.dart';
import 'package:zyota/pages/carros/carros_api.dart';
import 'package:zyota/pages/carros/carros_bloc.dart';
import 'package:zyota/pages/carros/carros_detalhes.dart';
import 'package:zyota/utils/nav.dart';
import 'package:zyota/widgets/text_error.dart';

class CarrosListView extends StatefulWidget {
  final String tipo;
  const CarrosListView(this.tipo, {super.key});

  @override
  State<CarrosListView> createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView>
    with AutomaticKeepAliveClientMixin<CarrosListView> {
  String get tipo => widget.tipo;
  final _bloc = CarrosBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _bloc.findAll(tipo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
        stream: _bloc.stream,
        builder: (context, snapshot) {
          // SE OCORREU ALGUM ERRO
          if (snapshot.hasError) {
            return const TextError("Não foi possível obter os dados!");
          }
          // SE NÃO TEM DADOS MOSTRA PROGRESS INDICATOR
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // SE TEM DADOS MOSTRA A LISTA
            List<Carro> carros = snapshot.data!;
            return _listViewBuilder(carros);
          }
        });
  }

  _listViewBuilder(List<Carro> carros) {
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
                          onPressed: () => _onClickDetalhes(c),
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

  _onClickDetalhes(Carro c) {
    push(context, CarrosDetalhes(c));
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
