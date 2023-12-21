import 'package:zyota/pages/carros/carros_api.dart';
import 'package:zyota/domains/carros.dart';
import 'package:zyota/utils/stream_bloc.dart';

// BLoC - Business Logic Object Components
// separação da regra de negócio da interface
// busca os dados na classe api por meio de streams. (ajuda na atualização de tela de forma reativa)
class CarrosBloc extends StreamBloc<List<Carro>> {
  Future<List<Carro>> findAll(String tipo) async {
    try {
      List<Carro> carros = await CarrosApi.getCarros(tipo);
      add(carros);
      return carros;
    } catch (e) {
      addError(e);
    }
    return [];
  }
}
