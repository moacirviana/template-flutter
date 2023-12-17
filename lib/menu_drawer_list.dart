import 'package:portserv/components/api_url.dart';
import 'package:portserv/pages/afastamentos_page.dart';
import 'package:portserv/domains/servidor.dart';
import 'package:portserv/pages/login_page.dart';
import 'package:portserv/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:portserv/pages/financeiro_page.dart';
import 'package:portserv/pages/maissaude_page.dart';
import 'package:portserv/pages/home_page.dart';

import '../pages/ferias_page.dart';

class MenuDrawerList extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    Future<Servidor> future = Servidor.get();

    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder(
                future: future,
                builder: (context, snapshot) {
                  Servidor? servidor = snapshot.data;
                  return servidor != null
                      ? _userAccountHeader(servidor)
                      : Container();
                }),
            ListTile(
              leading: const Icon(Icons.watch),
              title: const Text("Frequencia"),
              subtitle: Text("Ponto eletrônico"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => _onClickFrequencia(context),
            ),
            ListTile(
              leading: const Icon(Icons.money),
              title: const Text("Financeiro"),
              subtitle: Text("Contra-cheque..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => _onClickFinanceiro(context),
            ),
            ListTile(
              leading: Icon(Icons.sick),
              title: const Text("Mais Saúde"),
              subtitle: Text("extratos..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => _onClickMaisSaude(context),
            ),
            ListTile(
              leading: Icon(Icons.account_box_sharp),
              title: Text("Afastamentos"),
              subtitle: Text("Ferias,Folgas..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => _onClickAfastamentos(context),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => _onClickLogout(context),
            )
          ],
        ),
      ),
    );
  }

  _onClickFrequencia(BuildContext context) {
    Navigator.pop(context);
    push(context, HomePage(), replace: true);
  }

  _onClickLogout(BuildContext context) {
    Servidor.clear();
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }

  _onClickFinanceiro(BuildContext context) {
    Navigator.pop(context);
    push(context, FinanceiroPage(), replace: true);
  }

  _onClickMaisSaude(BuildContext context) {
    Navigator.pop(context);
    push(context, const MaisSaudePage(), replace: true);
  }

  _onClickAfastamentos(BuildContext context) {
    Navigator.pop(context);
    push(context, const AfastamentoPage(), replace: true);
  }
}
