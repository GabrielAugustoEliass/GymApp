import 'dart:convert';
import 'package:gym_app/shared/constants/routes/routes.dart';
import 'package:http/http.dart' as http;

class SingUpService {
  singUp(String email, String password) async {
    http.Response response = await http.post(
      Uri.parse(Routes.urlSignUp),
      body: json.encode(
        {
          "email": email,
          "password": password,
          "returnSecureToken": true
        },
      ),
    );
    print(response.body);
  }
}
