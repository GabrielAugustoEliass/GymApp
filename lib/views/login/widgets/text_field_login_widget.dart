// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../shared/constants/gym_colors/gym_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String nome;
  final IconData icon;
  final TextEditingController controller;
  const TextFieldWidget({
    super.key,
    required this.nome,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        autofocus: true,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          labelText: nome,
          labelStyle: TextStyle(color: GymColors.white),
          prefixIcon: Icon(
            icon,
            color: GymColors.white,
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
