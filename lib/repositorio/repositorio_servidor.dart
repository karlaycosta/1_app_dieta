import 'dart:convert';

import 'package:app_dieta/models/alimento.dart';
import 'package:app_dieta/repositorio/repositorio.dart';
import 'package:http/http.dart' as http;
const urlBase = 'http://10.6.2.201:8080';
class RepositorioServidor extends Repositorio {
  @override
  Future<List<Alimento>> getAlimentos() async {
    final res = await http.get(Uri.parse('$urlBase/alimentos'));
    final list = jsonDecode(res.body);
    final listaFinal = <Alimento>[];
    for (var item in list) {
      final alimento = Alimento.fromJson(item);
      listaFinal.add(alimento);
    }
    return listaFinal;
  }

  @override
  Future<List<Alimento>> getAlimentosFiltrados(String predicado) async {
    final res = await http.get(Uri.parse('$urlBase/alimentosfiltrados/$predicado'));
    final list = jsonDecode(res.body);
    final listaFinal = <Alimento>[];
    for (var item in list) {
      final alimento = Alimento.fromJson(item);
      listaFinal.add(alimento);
    }
    return listaFinal;
  }
}
