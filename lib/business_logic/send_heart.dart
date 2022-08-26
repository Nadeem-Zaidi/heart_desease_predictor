import 'dart:convert';

import 'package:http/http.dart' as http;

class SendHeart {
  Future<void> sendHeart(String age) async {
    try {
      var s = await http.post(
        Uri.parse("http://192.168.29.96:3000/age"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'age': age,
        }),
      );
      print(s.body);
    } catch (e) {
      print("error cought==${e}");
    }
  }
}
