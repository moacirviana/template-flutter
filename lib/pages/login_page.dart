import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _tLogin = TextEditingController(text: "015697172275");
  final _tSenha = TextEditingController(text: "123123");
   //final _tLogin = TextEditingController();
  //final _tSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  LoginPage({super.key});

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
            _text("Login", "Digite o login", controller: _tLogin, validator: _validateLogin),
            const SizedBox(
              height: 10,
            ),
            _text("Senha", "Digite a senha", pwdtext: true, controller:_tSenha, validator: _validateSenha),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 46,
              child: _button("Login", _onClickLogin), 
            )
          ],
        ),
      ),
    );
  }

  _button(String texto, onPressed) {
    return ElevatedButton(
        onPressed: onPressed,
            child: Text(
              texto,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
          );
  }

  TextFormField _text(String label, String hint, {bool pwdtext = false, 
  TextEditingController ?controller, FormFieldValidator<String> ?validator}) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: pwdtext,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontSize: 25, color: Colors.grey),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 16)),
      style: const TextStyle(
        fontSize: 25,
      ),
    );
  }

  _onClickLogin() {
     if (!_formKey.currentState!.validate()){
      return;
    }
    debugPrint("Login_____");
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

}
