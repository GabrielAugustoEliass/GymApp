// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../shared/constants/gym_colors/gym_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String nome;
  final IconData iconPrefixIcon;
  final IconButton? iconSuffixIcon;
  final TextEditingController controller;
  final Function(String)? validar;
  final bool isObscureText;
  const TextFieldWidget({
    super.key,
    required this.nome,
    required this.iconPrefixIcon,
    required this.controller,
    this.validar,
    this.iconSuffixIcon, required this.isObscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        obscureText: isObscureText,
        validator: (value) {
          if (validar != null) {
            return validar!(value!);
          } else {
            return null;
          }
        },
        controller: controller,
        autofocus: true,
        decoration: InputDecoration(
          
          suffixIcon: iconSuffixIcon,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          labelText: nome,
          labelStyle: TextStyle(color: GymColors.white),
          prefixIcon: Icon(
            iconPrefixIcon,
            color: GymColors.white,
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        style: TextStyle(
          color: GymColors.white,
        ),
      ),
    );
  }
}
