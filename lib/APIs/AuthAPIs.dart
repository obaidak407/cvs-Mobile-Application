import 'dart:convert';
import 'package:cvs_mobile_application/Config.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://cash-vs-scrap-backend.herokuapp.com/api';

class AuthAPIs {
  var client = http.Client();

  Future<dynamic> signup(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = object.toMap();
    print(object.toMap());
    var response = await client.post(url, body: _payload).catchError((e) {
      print(e);
    });
    print("This is Resposne from APIs: ");
    print(response.body);
    return json.decode(response.body);
  }

  Future<dynamic> login(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var response = await client.post(url, body: object).catchError((e) {
      print(e);
    });
    return json.decode(response.body);
  }
}
