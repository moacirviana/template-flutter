import 'package:flutter/material.dart';
import 'package:zyota/pages/favoritos/db_helper.dart';
import 'package:zyota/pages/home_page.dart';
import 'package:zyota/pages/login/login_page.dart';

import 'domains/usuario.dart';
import 'utils/nav.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    try {
      // inicializando banco de dados local SQLITE
      Future futureA = DatabaseHelper.getInstance().db;
      // aguardando 3 segundos
      Future futureB = Future.delayed(const Duration(seconds: 3));
      //usuario logado
      //Future<Usuario> futureC = Usuario.get();

      Future.wait([futureA, futureB]).then((value) {
        push(context, const LoginPage(), replace: true);
      });
    } catch (e) {
      push(context, const LoginPage(), replace: true);
    }
/*
    Future.delayed(const Duration(seconds: 10), () {
      push(context, const LoginPage());
    });
    DatabaseHelper.getInstance().db;
    */
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/brasao-brasil.png',
              height: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Portal Servidor",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
