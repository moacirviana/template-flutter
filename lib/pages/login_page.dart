import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          _text("Login", "Digite o login"),
          const SizedBox(
            height: 10,
          ),
          _text("Senha", "Digite a senha", pwdtext: true),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 46,
            child: ElevatedButton(
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  TextFormField _text(String label, String hint, {bool pwdtext = false}) {
    return TextFormField(
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
}
