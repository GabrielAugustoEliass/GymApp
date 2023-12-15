// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gym_app/shared/constants/gym_colors/gym_colors.dart';

class TextFieldCadastro extends StatelessWidget {
  final String nome;
  final IconData icon;
  final bool isObscureText;
  final TextEditingController? controller;
  const TextFieldCadastro({
    super.key,
    required this.nome,
    required this.icon,
    required this.isObscureText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: TextField(
        controller: controller,
        obscureText: isObscureText,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          labelText: nome,
          labelStyle: TextStyle(
            color: GymColors.white,
          ),
          prefixIcon: Icon(
            icon,
            color: GymColors.white,
          ),
        ),
      ),
    );
  }
}
