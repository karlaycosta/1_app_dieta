import 'package:app_dieta/models/alimento.dart';

abstract class Repositorio {
  // Busca todos os alimentos
  Future<List<Alimento>> getAlimentos();

  Future<List<Alimento>> getAlimentosFiltrados(String predicado);
}