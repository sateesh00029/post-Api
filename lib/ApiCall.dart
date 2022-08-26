import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:registerapicall/RegisterModel.dart';

class RegisterUser extends GetxController {
  var registerdata = RegisterModel().obs;
  Future<void> GetLogin(email, password) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://reqres.in/api/register'),
        headers: {"content-type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );
      if (response.statusCode == 200) {
        print('User Created');
        print(response.statusCode);
        var resdata1 = jsonDecode(response.body);
        print(resdata1);
      } else {
        print('Failed');
        var resdata1 = jsonDecode(response.body);
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onInit() {
    GetLogin('', '');
//
  }
}
