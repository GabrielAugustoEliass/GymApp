// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/shared/constants/gym_colors/gym_colors.dart';
import 'package:gym_app/views/cadastro/widgets/text_field_cadastro_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../shared/constants/gym_background_color_padrao/gym_background_color_padrao.dart';
import '../../../shared/model/login_model.dart';
import '../../../shared/constants/preferences_keys/preferences_key.dart';

// ignore: must_be_immutable
class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  bool value = false;

  final TextEditingController controllerNome = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerSenha = TextEditingController();
  final TextEditingController controllerConfirmaSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              GymBackGroundColorPadrao.blue,
              GymBackGroundColorPadrao.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 60, right: 30, left: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Cadastro',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: GymColors.white,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 10),
                TextFieldCadastro(
                  controller: controllerNome,
                  nome: 'Nome completo',
                  icon: Icons.person,
                  isObscureText: false,
                ),
                TextFieldCadastro(
                  controller: controllerEmail,
                  nome: 'E-mail',
                  icon: Icons.email,
                  isObscureText: false,
                ),
                TextFieldCadastro(
                  controller: controllerSenha,
                  nome: 'Senha',
                  icon: Icons.vpn_key,
                  isObscureText: (value == true) ? false : true,
                ),
                TextFieldCadastro(
                  controller: controllerConfirmaSenha,
                  nome: 'Confirma senha',
                  icon: Icons.vpn_key,
                  isObscureText: true,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: value,
                      onChanged: (bool? newValue) {
                        setState(() {
                          value = newValue!;
                        });
                      },
                    ),
                    Text(
                      'Mostrar senha',
                      style: TextStyle(
                        color: GymColors.white,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                    backgroundColor: GymColors.white,
                  ),
                  onPressed: () {
                    _cadastrar();
                    Get.back();
                  },
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(
                      color: GymColors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _cadastrar() {
    LoginModel userModel = LoginModel(
      name: controllerNome.text,
      email: controllerEmail.text,
      senha: controllerSenha.text,
      keppOn: true,
    );
    _saveUser(userModel);
  }

  void _saveUser(LoginModel userModel) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(PreferencesKey.key, jsonEncode(userModel.toJson()));
  }
}
