import 'package:app_dieta/models/refeicao.dart';
import 'package:flutter/material.dart';

class Dieta extends ValueNotifier<List<Refeicao>> {
  static late final Dieta _instance = Dieta._();

  Dieta._() : super(<Refeicao>[]){ print('object');}

  factory Dieta() => _instance;

  double get calorias {
    double calorias = 0;
    for (final refeicao in value) {
      calorias += refeicao.calorias;
    }
    return calorias;
  }

  void add(Refeicao refeicao) {
    value.add(refeicao);
    notifyListeners();
  }
}
