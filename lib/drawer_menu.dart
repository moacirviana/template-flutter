//import 'package:zyota/utils/api_url.dart';
import 'package:zyota/domains/servidor.dart';
import 'package:zyota/pages/login/login_page.dart';
import 'package:zyota/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:zyota/pages/home_page.dart';

class MenuDrawerList extends StatelessWidget {
  const MenuDrawerList({super.key});

  final String urlFoto =
      'https://intrapp.tre-am.jus.br/apiPortalServ/servidor/getfoto/2301634';

/*
  _userAccountHeader(Servidor s) {
    const urlServer = ApiServer.url;
    String urlFoto =
        "https://$urlServer/apiPortalServ/servidor/getfoto/${s.id}";
    return UserAccountsDrawerHeader(
      accountName: Text("${s.nome}"),
      accountEmail: Text("${s.email}"),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(urlFoto),
      ),
    );
  }
*/

  @override
  Widget build(BuildContext context) {
    Future<Servidor> future = Servidor.get();

    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("NOME DO USUARIO"),
              accountEmail: Text("fulano@tre-am.jus.br"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(urlFoto),
              ),
            ),
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
