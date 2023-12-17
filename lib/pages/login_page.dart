import 'package:flutter/material.dart';
import 'package:zyota/widgets/app_button.dart';
import 'package:zyota/widgets/app_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tLogin = TextEditingController(text: "015697172275");
  final _tSenha = TextEditingController(text: "123123");
   //final _tLogin = TextEditingController();
   //final _tSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  


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
              child: AppButton("Login", _onClickLogin), 
            )
          ],
        ),
      ),
    );
  }

/*
  _button(String texto, onPressed) {
    return ElevatedButton(
        onPressed: onPressed,
            child: Text(
              texto,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
          );
  }

 _text(String label, String hint, {bool pwdtext = false, 
                        TextEditingController ?controller, 
                        FormFieldValidator<String> ?validator,
                        TextInputType ?keyboardType,
                        TextInputAction ?textInputAction}) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: pwdtext,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
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
*/
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

  @override
  void dispose(){
    super.dispose();
  }

}
