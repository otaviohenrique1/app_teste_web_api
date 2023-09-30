import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  const CampoTexto({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    BorderStyle solid = BorderStyle.solid;
    const BorderRadius borderRadiusCircular =
        BorderRadius.all(Radius.circular(8));
    double fontSize = 16;
    double borderWidth = 2;

    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
        ),
        errorStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: borderRadiusCircular,
          borderSide: BorderSide(
            color: Colors.black,
            width: borderWidth,
            style: solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadiusCircular,
          borderSide: BorderSide(
            color: Colors.blue,
            width: borderWidth,
            style: solid,
          ),
        ),
      ),
    );
  }
}
