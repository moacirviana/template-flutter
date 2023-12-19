import 'package:flutter/material.dart';
import 'package:zyota/drawer_menu.dart';
import 'package:zyota/pages/carros/carros_api.dart';
import 'package:zyota/pages/carros/carros_listview.dart';
import 'package:zyota/utils/prefers_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin<HomePage> {
  TabController? _tabController;

  @override
  void initState(){
    super.initState();
    _initTabs();
  }

_initTabs() async {

    int tabIdx = await Prefs.getInt("tabIdx");

    _tabController = TabController(length: 3, vsync: this);

    setState(() {
      _tabController!.index = tabIdx;
    });

    _tabController!.addListener(() {
      Prefs.setInt("tabIdx", _tabController!.index);
    });
  }

/*
 Future<int> future = Prefs.getInt("tabIdx");
    future.then((value) {
      _tabController!.index = value;
    });
    _tabController!.addListener(() {
      Prefs.setInt("tabIdx", _tabController!.index);
    }); 
  */


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("TRE-AM Carros"),
        ),
        bottom:  _tabController == null
            ? null
            : TabBar(
          controller: _tabController,
          tabs: [
           Tab(text: "Clássicos"),
           Tab(text: "Esportivos"),
           Tab(text: "Luxo"),
        ]),
      ),
      body:  _tabController == null
            ?  const Center(
              child: CircularProgressIndicator(),
            )
            : TabBarView(
        controller: _tabController,
        children: [
          CarrosListView(TipoCarro.classicos),
          CarrosListView(TipoCarro.esportivos),
          CarrosListView(TipoCarro.luxo),
        ],
      ),
      drawer: const MenuDrawerList(),
    );
  }
}
