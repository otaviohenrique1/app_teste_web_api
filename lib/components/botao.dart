import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  const Botao({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final void Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: elevatedButtonStyle,
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
  padding: const EdgeInsets.all(8),
  minimumSize: const Size.fromHeight(48),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(100)),
  ),
);
