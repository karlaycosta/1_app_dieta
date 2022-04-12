import 'package:app_dieta/models/alimento.dart';
import 'package:app_dieta/models/refeicao.dart';
import 'package:app_dieta/screens/editar_alimentos.dart';
import 'package:app_dieta/screens/search.dart';
import 'package:app_dieta/utils/helper.dart';
import 'package:flutter/material.dart';

import '../widget/car_info_nutricional.dart';

class EditarRefeicao extends StatelessWidget {
  final Refeicao? refeicao;
  const EditarRefeicao({this.refeicao, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _refeicao = refeicao ?? Refeicao();
    final _controller = TextEditingController();
    _controller.text = _refeicao.nome;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refeição'),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
                _refeicao.adicionar(alimento);
              }
            },
          ),
        ],
      ),
      body: ValueListenableBuilder<List<Alimento>>(
        valueListenable: _refeicao,
        builder: (context, lista, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 14,
                  bottom: 2,
                ),
                child: TextField(
                  autofocus: true,
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome da Refeição',
                    hintText: 'Informe o nome da refeição',
                  ),
                  onChanged: (texto) {
                    _refeicao.nome = texto;
                  },
                ),
              ),
              CardInfoNutricional(infoNutricional: _refeicao),
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
                      '${formatarNumero(alimento.qtd)} g | P: ${formatarNumero(alimento.proteinas)} | C: ${alimento.carboidratos} | G: ${alimento.gorduras} | ${alimento.calorias} Kcal',
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
                      _refeicao.trocar(index, res);
                    },
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete_forever_rounded,
                        color: Colors.redAccent,
                      ),
                      iconSize: 38,
                      onPressed: () {
                        _refeicao.remover(alimento);
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
        child: const Icon(Icons.done_rounded),
        onPressed: () {
          if (_refeicao.value.isNotEmpty) {
            Navigator.of(context).pop(_refeicao);
          }
        },
      ),
    );
  }
}
