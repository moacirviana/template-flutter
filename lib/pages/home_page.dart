import 'package:flutter/material.dart';
import 'package:zyota/drawer_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("TRE-AM Página Principal"),
        ),
      ),
      body: _body(),
      drawer: const MenuDrawerList(),
    );
  }

  _body() {
    return const Center(
      child: Text(
        "Página principal do app",
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}
