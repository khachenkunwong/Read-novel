import 'dart:convert';

import 'package:http/http.dart' as Http;
import 'package:read_novel/data/data_all.dart';
import 'package:read_novel/models/model_login.dart';
//เอาเช็คว่ายืนยันตัวตนหรือยัง 
class Api {
  static Future<ModelLogin> get() async {
    // var url = "https://retoolapi.dev/bRaQnw/data/1";
    var url = "https://$urltest.ngrok.io/api/user/me/";
    var response = await Http.get(Uri.parse(url),
       // กำหนด headers Authorization เเล้วใส่ token มีให้เพื่อยืนยันตัวตน
        headers: {'Authorization': 'Token $token'});
    print('reapone headers me ${response.headers}');
    Map<String, dynamic> map = json.decode(response.body);
    print("Response status: ${response.body}");
    ModelLogin msg = ModelLogin.fromJson(map);
    print("" + "${msg.name}");
    return msg;
  }
}
