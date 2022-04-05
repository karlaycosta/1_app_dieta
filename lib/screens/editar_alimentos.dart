import 'package:app_dieta/models/alimento.dart';
import 'package:app_dieta/widget/texto_animado.dart';
import 'package:flutter/material.dart';

class EditarAlimentos extends StatelessWidget {
  final Alimento alimento;
  const EditarAlimentos({required this.alimento, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Alimento> valor = ValueNotifier(alimento);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: const Icon(Icons.done_rounded),
              onPressed: () {
                // Retorna o novo alimento
                Navigator.of(context).pop(valor.value);
              },
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              alimento.nome,
              style: const TextStyle(fontSize: 38),
            ),
          ),
          const Divider(),
          Center(
            child: ValueListenableBuilder<Alimento>(
              valueListenable: valor,
              builder: (context, alimento, child) {
                return TextoAnimado(
                  begin: alimento.qtd,
                  end: alimento.qtd,
                  pontuacao: ',',
                  style: const TextStyle(fontSize: 38),
                );
              },
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(80, 50),
                ),
                child: const Text(
                  '-10',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  if (valor.value.qtd - 10 > 0) {
                    valor.value = valor.value.copyWith(
                      qtd: valor.value.qtd - 10,
                    );
                  }
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(80, 50),
                ),
                child: const Text(
                  '+10',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  valor.value = valor.value.copyWith(
                    qtd: valor.value.qtd + 10,
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
