import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {
  //final VoidCallback? onPressed;
  final Function()? onClick;
  final String texto;
   //const AppButton(this.texto, {super.key});
   const AppButton(this.texto, this.onClick, {super.key});

  @override
  Widget build(BuildContext context) {
     return ElevatedButton(
        onPressed: onClick,
            child: Text(
              texto,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
          );
  }
}