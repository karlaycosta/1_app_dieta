import 'package:app_dieta/models/alimento.dart';
import 'package:flutter/cupertino.dart';

class Refeicao extends ValueNotifier<List<Alimento>> {
  Refeicao() : super(<Alimento>[]);

  double get calorias {
    double calorias = 0;
    for (final alimento in value) {
      calorias += alimento.calorias;
    }
    return calorias;
  }

  /// Adiciona um alimento na lista
  /// e notifica seus ouvintes
  void add(Alimento alimento) {
    value.add(alimento);
    notifyListeners();
  }

  bool remove(Alimento alimento) {
    if (value.remove(alimento)) {
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  /// Troca o alimento na lista interna com base no
  /// indice.
  void trocar(int indice, Alimento? alimento) {
    if (alimento != null) {
      if (alimento.qtdBase != value[indice].qtdBase) {
        value[indice] = alimento;
        notifyListeners();
      }
    }
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
