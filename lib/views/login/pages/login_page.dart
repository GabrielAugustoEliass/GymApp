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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController controllerEmail = TextEditingController();

  final TextEditingController controllerSenha = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool showPassword = true;

  void isShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

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
          child: Form(
            key: _formKey,
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
                  validar: (value) {
                    if (value.length < 4) {
                      return 'E-mail curto demais';
                    } else if (!value.contains("@")) {
                      return 'O e-mail deve contér @';
                    } else {
                      return null;
                    }
                  },
                  nome: 'E-mail',
                  iconPrefixIcon: Icons.email,
                  controller: controllerEmail,
                  isObscureText: true,
                ),
                TextFieldWidget(
                  iconSuffixIcon: IconButton(
                    onPressed: () {
                      isShowPassword();
                    },
                    icon: Icon(
                      showPassword ? Icons.visibility_off : Icons.visibility,
                      color: GymColors.white,
                    ),
                  ),
                  validar: (value) {
                    if (value.length < 4) {
                      return 'A senha deve contér no minimo 6 digitos';
                    }
                    return null;
                  },
                  nome: 'Senha',
                  iconPrefixIcon: Icons.vpn_key,
                  controller: controllerSenha,
                  isObscureText: showPassword,
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
                  colorText: GymColors.white,
                  backgroundColor: GymColors.roxo,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print('Válidado');
                    } else {
                      print('Não válido');
                      return;
                    }
                  },
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
                  colorText: Colors.black,
                  backgroundColor: GymColors.white,
                  onTap: () {
                    Get.to(CadastroPage());
                  },
                ),
              ],
            ),
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
