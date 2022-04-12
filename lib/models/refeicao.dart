import 'package:app_dieta/models/alimento.dart';
import 'package:app_dieta/models/reativa.dart';

class Refeicao extends Reativa<Alimento> {
  String nome;
  Refeicao({
    this.nome = '',
  });

  Refeicao copyWith() {
    final novaRefeicao = Refeicao();
    novaRefeicao.nome = nome;
    // Passando o valor da lista de alimentos
    // para a nova refeição
    novaRefeicao.value = value.toList();
    return novaRefeicao;
  }
}
