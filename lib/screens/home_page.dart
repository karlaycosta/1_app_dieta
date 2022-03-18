import 'dart:convert';

import 'package:app_dieta/models/texto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('object');
    final texto = Texto(value: 'Data');
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Dieta'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {
              Navigator.of(context).pushNamed('/search');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ValueListenableBuilder<String>(
              valueListenable: texto,
              builder: (context, value, child) {
                return Text(value,
                    style: TextStyle(
                      fontSize: 38,
                    ));
              },
            ),
            ElevatedButton(
              child: Text('teste'),
              onPressed: () async {
                final res = await get(Uri.parse('http://localhost:8080/teste'));
                final lista = jsonDecode(res.body);
                final aluno1 = lista[0]['nome1'];
                final aluno2 = lista[1]['nome2'];
                print(aluno1);
                print(aluno2);
                // texto.value = 'Novo Valor';
              },
            ),
          ],
        ),
      ),
    );
  }
}
