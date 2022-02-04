import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder<String>(
        future: teste(),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          }
          final teste = snapshot.data!;
          return ListView.separated(
            itemCount: 1,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(teste),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
          );
        },
      ),
    );
  }

  Future<String> teste() async {
    final res = await http.get(Uri.parse(
        'https://570b-2804-214-81bb-d3-21ca-669c-fd11-243d.sa.ngrok.io/teste'));
    final list = jsonDecode(res.body);
    return list['nome'];
  }
}
