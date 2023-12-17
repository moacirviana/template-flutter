import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {

  final String label;
  final String hint;
  final bool hiddindpwdtext;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  const AppTextField(this.label, this.hint, {super.key, this.hiddindpwdtext=false,
                     this.controller, this.validator, this.keyboardType, this.textInputAction});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: hiddindpwdtext,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
       decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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