import 'dart:convert';

import 'package:app_dieta/models/alimento.dart';
import 'package:app_dieta/repositorio/repositorio.dart';
import 'package:http/http.dart' as http;

class RepositorioServidor extends Repositorio {
  @override
  Future<List<Alimento>> getAlimentos() async {
    final res = await http.get(Uri.parse('https://570b-2804-214-81bb-d3-21ca-669c-fd11-243d.sa.ngrok.io/alimentos'));
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
    final res = await http.get(Uri.parse('https://570b-2804-214-81bb-d3-21ca-669c-fd11-243d.sa.ngrok.io/alimentosfiltrados/$predicado'));
    final list = jsonDecode(res.body);
    final listaFinal = <Alimento>[];
    for (var item in list) {
      final alimento = Alimento.fromJson(item);
      listaFinal.add(alimento);
    }
    return listaFinal;
  }
}
