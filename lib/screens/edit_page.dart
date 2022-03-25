import 'package:app_dieta/models/alimento.dart';
import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  final Alimento alimento;
  const EditPage({required this.alimento, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Alimento> valor = ValueNotifier(alimento);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.pix, size: 38,),
            onPressed: () {
              // Retorna o novo alimento
              Navigator.of(context).pop(valor.value);
            },
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
                return Text(
                  '${alimento.qtdBase}',
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
                  if (valor.value.qtdBase - 10 > 0) {
                    valor.value = valor.value.copyWith(
                      qtdBase: valor.value.qtdBase - 10,
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
                    qtdBase: valor.value.qtdBase + 10,
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
