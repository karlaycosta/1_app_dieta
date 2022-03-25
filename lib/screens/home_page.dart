import 'package:app_dieta/models/alimento.dart';
import 'package:app_dieta/models/refeicao.dart';
import 'package:app_dieta/screens/edit_page.dart';
import 'package:app_dieta/screens/search.dart';
import 'package:app_dieta/utils/helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final refeicao = Refeicao();
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
                refeicao.add(alimento);
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
              Container(
                height: 200,
                color: Colors.green,
                child: Center(
                  child: Text(
                    '${formatarNumero(refeicao.calorias())} Kcal',
                    style: const TextStyle(
                      fontSize: 64,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
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
                      '${formatarNumero(alimento.qtdBase)} g | P: ${formatarNumero(alimento.proteinaR)} | C: ${alimento.carboidratoR} | G: ${alimento.gorduraR} | ${alimento.calorias} Kcal',
                      style: const TextStyle(fontSize: 22),
                    ),
                    onTap: () async {
                      // aguarda o novo valor do alimento
                      final res = await Navigator.of(context).push<Alimento>(
                        MaterialPageRoute(builder: (context) => EditPage(alimento: alimento)),
                      );
                      // Troca o alimento com base no indice
                      refeicao.trocar(index, res);
                    },
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
