// ignore_for_file: unnecessary_this, prefer_collection_literals

class LoginModel {
  String? name;
  String? email;
  String? senha;
  bool? keepOn;

  LoginModel({this.name, this.email, this.senha, required bool keppOn});

  LoginModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    senha = json['senha'];
    keepOn = json['keepOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['keepOn'] = this.keepOn;
    return data;
  }
}
