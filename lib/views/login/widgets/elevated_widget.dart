// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ElevatedWidget extends StatelessWidget {
  final String nome;
  final Color? colorText;
  final Color? backgroundColor;
  final Function() onTap;
  const ElevatedWidget(
      {super.key,
      required this.nome,
      this.colorText,
      this.backgroundColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        backgroundColor: backgroundColor,
      ),
      onPressed: onTap,
      child: Text(
        nome,
        style: TextStyle(color: colorText),
      ),
    );
  }
}
