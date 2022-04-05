import 'package:app_dieta/models/alimento.dart';
import 'package:app_dieta/models/dieta.dart';
import 'package:app_dieta/models/info_nutricional.dart';
import 'package:app_dieta/models/reativa.dart';
import 'package:app_dieta/models/refeicao.dart';
import 'package:app_dieta/screens/editar_alimentos.dart';
import 'package:app_dieta/screens/search.dart';
import 'package:app_dieta/utils/helper.dart';
import 'package:app_dieta/widget/texto_animado.dart';
import 'package:flutter/material.dart';

import '../widget/car_info_nutricional.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final refeicao = Refeicao();
    // final dieta = Dieta();
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Dieta'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () async {
              final alimento = await Navigator.of(context).push<Alimento>(
                MaterialPageRoute(
                  builder: (context) => const Search(),
                ),
              );
              if (alimento != null) {
                refeicao.adicionar(alimento);
              }
            },
          ),
        ],
      ),
      body: ValueListenableBuilder<List<Alimento>>(
        valueListenable: refeicao,
        builder: (context, lista, child) {
          return Column(
            children: [
              CardInfoNutricional(infoNutricional: refeicao),
              ListView.separated(
                shrinkWrap: true,
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  final alimento = lista[index];
                  return ListTile(
                    title: Text(
                      alimento.nome,
                      style: const TextStyle(fontSize: 32),
                    ),
                    subtitle: Text(
                      '${formatarNumero(alimento.qtd)} g | P: ${formatarNumero(alimento.proteinaR)} | C: ${alimento.carboidratoR} | G: ${alimento.gorduraR} | ${alimento.calorias} Kcal',
                      style: const TextStyle(fontSize: 22),
                    ),
                    onTap: () async {
                      // aguarda o novo valor do alimento
                      final res = await Navigator.of(context).push<Alimento>(
                        MaterialPageRoute(
                            builder: (context) =>
                                EditarAlimentos(alimento: alimento)),
                      );
                      // Troca o alimento com base no indice
                      refeicao.trocar(index, res);
                    },
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete_forever_rounded,
                        color: Colors.redAccent,
                      ),
                      iconSize: 38,
                      onPressed: () {
                        refeicao.remover(alimento);
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(height: 0),
              ),
            ],
          );
        },
      ),
    );
  }
}