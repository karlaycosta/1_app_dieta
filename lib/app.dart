import 'package:app_dieta/screens/edit_page.dart';
import 'package:app_dieta/screens/home_page.dart';
import 'package:app_dieta/screens/search.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/search': (context) => const Search(),
      },
    );
  }
}
