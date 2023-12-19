//import 'package:zyota/utils/api_url.dart';
import 'package:zyota/domains/servidor.dart';
import 'package:zyota/domains/usuario.dart';
import 'package:zyota/pages/carros/carros_home_page.dart';
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
            FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                Usuario? user = snapshot.data;
                return user != null ? _header(user) : Container();
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              subtitle: const Text("Página principal"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => _goToHomePage(context),
            ),
            ListTile(
              leading: const Icon(Icons.car_rental),
              title: const Text("Carros"),
              subtitle: const Text("Consulta os carros do TREAM"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => _goCarrosList(context),
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

  _goToHomePage(BuildContext context) {
    Navigator.pop(context);
    push(context, const HomePage(), replace: true);
  }

  _goCarrosList(BuildContext context) {
    Navigator.pop(context);
    push(context, const CarrosHomePage(), replace: true);
  }

  _onClickLogout(BuildContext context) {
    Usuario.clear();
    Navigator.pop(context);
    push(context, const LoginPage(), replace: true);
  }
}
