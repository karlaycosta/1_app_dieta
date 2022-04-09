import 'package:app_dieta/models/alimento.dart';
import 'package:app_dieta/models/reativa.dart';

class Refeicao extends Reativa<Alimento> {
  Refeicao({List<Alimento>? lista}) : super(lista: lista != null ? [...lista] : null);
  // Refeicao copyWith(Refeicao antigaRefeicao) {
  //   return Refeicao(lista: [...antigaRefeicao.value]);
  // }
}
