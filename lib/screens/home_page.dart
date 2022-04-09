import 'package:app_dieta/models/dieta.dart';
import 'package:app_dieta/models/refeicao.dart';
import 'package:app_dieta/screens/editar_refeicao.dart';
import 'package:flutter/material.dart';

import '../utils/helper.dart';
import '../widget/car_info_nutricional.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dieta = Dieta();
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Dieta'),
      ),
      body: ValueListenableBuilder<List<Refeicao>>(
        valueListenable: dieta,
        builder: (context, refeicoes, child) {
          print('Builder..........');
          return Column(
            children: [
              CardInfoNutricional(infoNutricional: dieta),
              ListView.separated(
                shrinkWrap: true,
                itemCount: refeicoes.length,
                itemBuilder: (context, index) {
                  final refeicao = refeicoes[index];
                  return ListTile(
                    title: Text(
                      '${index + 1}',
                      style: const TextStyle(fontSize: 32),
                    ),
                    subtitle: Text(
                      '${formatarNumero(refeicao.qtd)} g | P: ${formatarNumero(refeicao.proteinas)} | C: ${refeicao.carboidratos} | G: ${refeicao.gorduras} | ${formatarNumero(refeicao.calorias)} Kcal',
                      style: const TextStyle(fontSize: 22),
                    ),
                    onTap: () async {
                      // aguarda o novo valor do alimento
                      final res = await Navigator.of(context).push<Refeicao>(
                        MaterialPageRoute(
                            builder: (context) =>
                                EditarRefeicao(refeicao: refeicao)),
                      );
                      // Troca o alimento com base no indice
                      print(res);
                      dieta.trocar(index, res);
                    },
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete_forever_rounded,
                        color: Colors.redAccent,
                      ),
                      iconSize: 38,
                      onPressed: () {
                        dieta.remover(refeicao);
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_rounded),
        onPressed: () async {
          final res = await Navigator.of(context).push<Refeicao>(
            MaterialPageRoute(
                builder: (context) => const EditarRefeicao()),
          );
          dieta.adicionar(res);
        },
      ),
    );
  }
}
