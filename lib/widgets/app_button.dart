import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {
  //final VoidCallback? onPressed;
  final Function()? onClick;
  final String texto;
  final bool showProress;
   const AppButton(this.texto, this.onClick, {super.key, this.showProress=false});

  @override
  Widget build(BuildContext context) {
     return ElevatedButton(
        onPressed: onClick,
            child: showProress ? const Center(child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),)
            :
            Text(
              texto,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
          );
  }
}