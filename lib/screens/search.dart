import 'dart:developer';

import 'package:app_dieta/models/alimento.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _controller = TextEditingController();
  final _focus = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        title: TextField(
          focusNode: _focus,
          controller: _controller,
          autofocus: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Pesquisar',
          ),
          onChanged: (value) {
            if (value.length >= 3) {}
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.cancel_rounded),
            onPressed: () {
              _controller.text = '';
              _focus.requestFocus();
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Alimento>>(
          future: getData(),
          builder: (context, snapshot) {
            return const LinearProgressIndicator();
          }),
    );
  }

  Future<List<Alimento>> getData() async {
    final alimentos = <Alimento>[];
    if (_controller.text.length >= 3) {
      final res =
          await Supabase.instance.client.from('alimentos').select().execute();
      if (res.error != null) {
        log(
          'Erro na consulta',
          name: 'App Dieta',
          error: res.error,
        );
      } else {
        final data = res.data as List;
        for (var alimento in data) {
          alimentos.add(Alimento.fromJson(alimento));
        }
      }
    }
    return alimentos;
  }
}
