import 'package:app_dieta/models/alimento.dart';

class Refeicao {
  final alimentos = <Alimento>[];

  double calorias() {
    double calorias = 0;
    for (final alimento in alimentos) {
      calorias += alimento.calorias;
    }
    return calorias;
  }

  double proteinas() {
    double proteinas = 0;
    for (final alimento in alimentos) {
      proteinas += alimento.proteina;
    }
    return proteinas;
  }
}
