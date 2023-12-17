import 'package:flutter/material.dart';

alert(context, String msg) {
   if (context.mounted){
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context){
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: const Text("Portal Servidor"),
              content: Text(msg),
              actions: [
                TextButton(
                  onPressed: () {
                        Navigator.pop(context);
                    }, 
                child: const Text("Ok"),
                )
              ],
            ),
          );
        },
      );
   }
}
