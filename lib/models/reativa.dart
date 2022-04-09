import 'package:app_dieta/models/info_nutricional.dart';
import 'package:flutter/cupertino.dart';

abstract class Reativa<T extends InfoNutricional> extends ValueNotifier<List<T>>
    implements InfoNutricional {
  Reativa({List<T>? lista}) : super(lista ?? <T>[]);

  void adicionar(T? item) {
    if (item != null) {
      value.add(item);
      notifyListeners();
    }
  }

  bool remover(T item) {
    if (value.remove(item)) {
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  void trocar(int indice, T? item) {
    if (item != null) {
      print('Novo: ${item.qtd} | Antigo: ${value[indice].qtd}');
      if (item.qtd != value[indice].qtd) {
        print('Etapa 2.......');
        value[indice] = item;
        notifyListeners();
        print('Notificou.......');
      }
    }
  }

  @override
  double get calorias {
    double total = 0;
    for (final item in value) {
      total += item.calorias;
    }
    return total;
  }

  @override
  double get carboidratos {
    double total = 0;
    for (final item in value) {
      total += item.carboidratos;
    }
    return total;
  }

  @override
  double? get fibras {
    double total = 0;
    for (final item in value) {
      total += item.fibras ?? 0;
    }
    return total;
  }

  @override
  double? get gSaturadas {
    double total = 0;
    for (final item in value) {
      total += item.gSaturadas ?? 0;
    }
    return total;
  }

  @override
  double? get gTrans {
    double total = 0;
    for (final item in value) {
      total += item.gTrans ?? 0;
    }
    return total;
  }

  @override
  double get gorduras {
    double total = 0;
    for (final item in value) {
      total += item.gorduras;
    }
    return total;
  }

  @override
  double get proteinas {
    double total = 0;
    for (final item in value) {
      total += item.proteinas;
    }
    return total;
  }

  @override
  double get qtd {
    double total = 0;
    for (final item in value) {
      total += item.qtd;
    }
    return total;
  }

  @override
  double? get sodio {
    double total = 0;
    for (final item in value) {
      total += item.sodio ?? 0;
    }
    return total;
  }
}
