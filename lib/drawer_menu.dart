//import 'package:zyota/utils/api_url.dart';
import 'package:zyota/domains/servidor.dart';
import 'package:zyota/domains/usuario.dart';
import 'package:zyota/pages/login/login_page.dart';
import 'package:zyota/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:zyota/pages/home_page.dart';

class MenuDrawerList extends StatelessWidget {
  const MenuDrawerList({super.key});


  @override
  Widget build(BuildContext context) {
    Future<Usuario> future = Usuario.get();

    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            FutureBuilder(future: future, builder: (context, snapshot) {
                Usuario? user = snapshot.data;
                return user != null ? _header(user) : Container();
            },),
            ListTile(
              leading: const Icon(Icons.account_box_sharp),
              title: const Text("Afastamentos"),
              subtitle: const Text("Ferias,Folgas..."),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => _onClickMenu(context),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Logout"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => _onClickLogout(context),
            )
          ],
        ),
      ),
    );
  }

 _header(Usuario user) {
    return UserAccountsDrawerHeader(
            accountName: Text(user.nome!),
            accountEmail: Text(user.email!),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(user.urlFoto!),
            ),
          );
  }

  _onClickMenu(BuildContext context) {
    Navigator.pop(context);
    push(context, const HomePage(), replace: true);
  }

  _onClickLogout(BuildContext context) {
    Servidor.clear();
    Navigator.pop(context);
    push(context, const LoginPage(), replace: true);
  }
}
