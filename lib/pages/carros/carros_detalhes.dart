import 'package:flutter/material.dart';
import 'package:zyota/domains/carros.dart';
import 'package:zyota/widgets/text.dart';
import 'package:zyota/widgets/text_error.dart';
import 'loripsum_api.dart';

class CarrosDetalhes extends StatefulWidget {
  final Carro carro;
  const CarrosDetalhes(this.carro, {super.key});

  @override
  State<CarrosDetalhes> createState() => _CarrosDetalhesState();
}

class _CarrosDetalhesState extends State<CarrosDetalhes> {
  final _loripsumBloc = LoripsumBloc();

  @override
  void initState() {
    super.initState();
    _loripsumBloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.carro.nome!),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.place),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.videocam),
          ),
          PopupMenuButton(
              onSelected: (value) => _onPopupMenu(value),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: "edit",
                    child: Text("Editar"),
                  ),
                  const PopupMenuItem(
                    value: "delete",
                    child: Text("Deletar"),
                  ),
                  const PopupMenuItem(
                    value: "share",
                    child: Text("Share"),
                  )
                ];
              })
        ],
      ),
      body: _body(),
    );
  }

  _onPopupMenu(String value) {
    switch (value) {
      case "edit":
        debugPrint("Clickou editar");
        break;
      case "delete":
        debugPrint("Clickou deletar");
        break;
      case "share":
        debugPrint("Clickou compartilhar");
        break;
    }
  }

  _body() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Center(
            child: Image.network(
                widget.carro.urlFoto ??
                    "https://e7.pngegg.com/pngimages/462/631/png-clipart-sports-car-black-and-white-car-compact-car-car-accident-thumbnail.png",
                width: 350, errorBuilder: (BuildContext context,
                    Object exception, StackTrace? stackTrace) {
              return const Text('😢 image not found');
            }),
          ),
          _bloco1(),
          const Divider(),
          _bloco2()
        ],
      ),
    );
  }

  _bloco2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: 20, child: text(widget.carro.descricao!, fontSize: 16)),
        const SizedBox(height: 20),
        StreamBuilder(
            stream: _loripsumBloc.stream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const TextError("Ocorreu um erro");
              }

              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return text(snapshot.data!, fontSize: 16);
            })
      ],
    );
  }

  Row _bloco1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text(widget.carro.nome!, fontSize: 20, bold: true),
            text("${widget.carro.tipo!} (${widget.carro.id!})", fontSize: 16),
          ],
        ),
        Row(
          children: [
            IconButton(
                onPressed: () => _onClickFavorito(),
                icon: const Icon(
                  Icons.favorite,
                  size: 40,
                )),
            IconButton(
                onPressed: () => _onClickShare(),
                icon: const Icon(
                  Icons.share,
                  size: 40,
                ))
          ],
        )
      ],
    );
  }

  _onClickFavorito() {
    debugPrint("Clicou favorito");
  }

  _onClickShare() {
    debugPrint("Clicou compartilhar");
  }

  @override
  void dispose() {
    super.dispose();
    _loripsumBloc.dispose();
  }
}
