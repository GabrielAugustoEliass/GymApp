// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_is_empty, void_checks

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LearnFirebase extends StatefulWidget {
  const LearnFirebase({super.key});

  @override
  State<LearnFirebase> createState() => _LearnFirebaseState();
}

class _LearnFirebaseState extends State<LearnFirebase> {
  List<String> listString = ['Nenhum Registro inicializado!'];
  final url =
      Uri.https('gym-app-372bf-default-rtdb.firebaseio.com', '/words.json');
  bool isLoading = false;

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Center(
            child: (isLoading)
                ? CircularProgressIndicator()
                : RefreshIndicator(
                    onRefresh: getInformations,
                    child: ListView(
                      children: [
                        TextField(
                          controller: controller,
                          decoration: InputDecoration(
                              labelText: 'Insira uma palavra aqui:'),
                        ),
                        ElevatedButton(
                          onPressed: _addStringToBack,
                          child: Text('Gravar no Firebase'),
                        ),
                        for (String s in listString) Text(s),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Future<void> getInformations() {
    return http.get(url).then((value) {
      Map<String, dynamic> map = json.decode(value.body);
      listString = [];
      map.forEach((key, value) {
        setState(() {
          listString.add(map[key]['words']);
        });
      });
    });
  }

  _addStringToBack() {
    setState(() {
      isLoading = true;
    });
    http
        .post(
      url,
      body: json.encode(
        {"words": controller.text},
      ),
    )
        .then((value) {
      getInformations().then((value) {
        setState(() {
          isLoading = false;
        });
      });
    });
  }
}
