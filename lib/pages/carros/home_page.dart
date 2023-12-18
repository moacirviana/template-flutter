import 'package:flutter/material.dart';
import 'package:zyota/drawer_menu.dart';
import 'package:zyota/pages/carros/carros_api.dart';
import 'package:zyota/pages/carros/carros_listview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("TRE-AM Carros"),
          ),
          bottom: const TabBar(tabs: [
            Tab(text: "Clássicos"),
            Tab(text: "Esportivos"),
            Tab(text: "Luxo"),
          ]),
        ),
        body: const TabBarView(
          children: [
            CarrosListView(TipoCarro.classicos),
            CarrosListView(TipoCarro.esportivos),
            CarrosListView(TipoCarro.luxo),
          ],
        ),
        drawer: const MenuDrawerList(),
      ),
    );
  }
}
