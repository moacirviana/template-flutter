import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  //final VoidCallback? onPressed;
  final Function()? onClick;
  final String texto;
  final bool showProgress;
  const AppButton(this.texto, this.onClick,
      {super.key, this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      child: showProgress
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            )
          : Text(
              texto,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
    );
  }
}
