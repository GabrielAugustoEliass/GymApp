// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_this, unused_element

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/shared/constants/preferences_keys/preferences_key.dart';
import 'package:gym_app/views/cadastro/pages/cadastro_page.dart';
import 'package:gym_app/views/login/widgets/elevated_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../shared/constants/gym_background_color_padrao/gym_background_color_padrao.dart';
import '../../../shared/model/login_model.dart';
import '../../../shared/constants/gym_colors/gym_colors.dart';
import '../widgets/text_field_login_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 40),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 80),
              Image.asset(
                'assets/dumbbell.png',
                height: 140,
              ),
              TextFieldWidget(
                nome: 'E-mail',
                icon: Icons.email,
                controller: controllerEmail,
              ),
              TextFieldWidget(
                nome: 'Senha',
                icon: Icons.vpn_key,
                controller: controllerSenha,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Esqueceu a senha?',
                  style: TextStyle(color: GymColors.white, fontSize: 15),
                  textAlign: TextAlign.right,
                ),
              ),
              ElevatedWidget(
                nome: 'Login',
                backgroundColor: GymColors.roxo,
                onTap: () {},
              ),
              SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.only(top: 7, bottom: 7),
                child: Divider(
                  thickness: 0.5,
                  color: Colors.black,
                ),
              ),
              Text(
                'Ainda não tem uma conta?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 5),
              ElevatedWidget(
                nome: 'Cadastre-se',
                colorNome: Colors.black,
                backgroundColor: GymColors.white,
                onTap: () {
                  Get.to(CadastroPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _doLogin() async {
    final emailform = this.controllerEmail.text;
    final senhaform = this.controllerSenha.text;

    LoginModel user = await getSavedUser();
  }

  Future<LoginModel> getSavedUser() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonUser = prefs.getString(PreferencesKey.key);
    Map<String, dynamic> mapUser = json.decode(jsonUser!);
    LoginModel userModel = LoginModel.fromJson(mapUser);
    return userModel;
  }
}
