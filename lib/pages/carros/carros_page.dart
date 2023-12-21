import 'package:flutter/material.dart';
import 'package:zyota/domains/carros.dart';
import 'package:zyota/pages/carros/carros_bloc.dart';
import 'package:zyota/pages/carros/list_view.dart';
import 'package:zyota/widgets/text_error.dart';

class CarrosPage extends StatefulWidget {
  final String tipo;
  const CarrosPage(this.tipo, {super.key});

  @override
  State<CarrosPage> createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage>
    with AutomaticKeepAliveClientMixin<CarrosPage> {
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
            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: CarroListView(carros),
            );
          }
        });
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  Future<void> _onRefresh() {
    return _bloc.findAll(tipo);
  }
}
