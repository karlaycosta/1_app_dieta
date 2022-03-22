import 'package:app_dieta/models/alimento.dart';
import 'package:flutter/cupertino.dart';

class Refeicao extends ValueNotifier<List<Alimento>> {
  Refeicao() : super(<Alimento>[]);

  void add(Alimento alimento) {
    value.add(alimento);
    notifyListeners();
  }

  void replace(Alimento? alimento) {
    print('object');
    if (value.contains(alimento)) {
      print('object');
      // Testa se o ID do alimento é diferente de nulo
        final indice = value.indexWhere((interno) => interno.id == alimento!.id);
        if (alimento!.qtdBase != value[indice].qtdBase) {
          value[indice] = alimento;
          notifyListeners();
        }
    }
  }

  double calorias() {
    double calorias = 0;
    for (final alimento in value) {
      calorias += alimento.calorias;
    }
    return calorias;
  }

  double proteinas() {
    double proteinas = 0;
    for (final alimento in value) {
      proteinas += alimento.proteina;
    }
    return proteinas;
  }

  double carboidratos() {
    double carboidratos = 0;
    for (final alimento in value) {
      carboidratos += alimento.carboidrato;
    }
    return carboidratos;
  }

  double gorduras() {
    double gorduras = 0;
    for (final alimento in value) {
      gorduras += alimento.gordura;
    }
    return gorduras;
  }
}
