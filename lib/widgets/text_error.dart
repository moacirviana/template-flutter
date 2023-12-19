import 'package:flutter/material.dart';

class TextError extends StatelessWidget {
  final String? msg;

  const TextError(this.msg, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 45),
            Text(
              msg!,
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
