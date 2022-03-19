import 'package:app_dieta/models/alimento.dart';
import 'package:flutter/cupertino.dart';

class Refeicao extends ValueNotifier<List<Alimento>>{

  Refeicao() : super(<Alimento>[]);

  void add(Alimento alimento) {
    value.add(alimento);
    notifyListeners();
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
}
