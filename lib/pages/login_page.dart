import 'package:flutter/material.dart';
import 'package:zyota/domains/usuario.dart';
import 'package:zyota/pages/home_page.dart';
import 'package:zyota/pages/login_api.dart';
import 'package:zyota/uitl/alert.dart';
import 'package:zyota/uitl/nav.dart';
import 'package:zyota/uitl/api_response.dart';
import 'package:zyota/widgets/app_button.dart';
import 'package:zyota/widgets/app_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tLogin = TextEditingController(text: "user");
  final _tSenha = TextEditingController(text: "123");
   //final _tLogin = TextEditingController();
   //final _tSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showProgress = false;
  


 @override
 void initState(){
  super.initState();
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("TRE-AM Template FlutterApp"),
        ),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            AppTextField("Login", "Digite o login", controller: _tLogin, 
                      validator: _validateLogin, textInputAction: TextInputAction.next,),
            const SizedBox(height: 16),
            AppTextField("Senha", "Digite a senha", hiddindpwdtext: true, controller:_tSenha, 
                       validator: _validateSenha, keyboardType: TextInputType.number,),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 46,
              child: AppButton("Login", _onClickLogin, showProress: _showProgress), 
            )
          ],
        ),
      ),
    );
  }

 _onClickLogin() async{
     if (!_formKey.currentState!.validate()){
      return;
    }
    String login = _tLogin.text;
    String senha = _tSenha.text;
    setState(() {
      _showProgress = true;
    });
    ApiResponse response = await LoginApi.login(login, senha);

    if (response.ok!){
      Usuario user = response.result;
      debugPrint(user.toString());
      push(context, const HomePage(), replace: true);
      
    }else{
      //debugPrint(response.msg);
      alert(context, response.msg!);
    }
    setState(() {
      _showProgress = false;
    });
  }

  String? _validateLogin(String? value) {
     if(value != null && value.isEmpty){
         return "Digite o login";
     }return null; 
  }

  String? _validateSenha(String? value) {
     if(value != null && value.isEmpty){
         return "Digite a senha";
     }
      if(value!.length <3){
         return "A senha precisa ter pelo menos 3 caracteres.";
     }
     return null; 
  }

  @override
  void dispose(){
    super.dispose();
  }

}
