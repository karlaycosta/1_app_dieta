import 'package:app_dieta/models/alimento.dart';

abstract class Repositorio {
  Future<List<Alimento>> getAlimentos();
}