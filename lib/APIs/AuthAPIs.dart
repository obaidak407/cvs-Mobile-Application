// ignore: file_names
import 'dart:convert';
import 'dart:io';
import 'package:amplify_flutter/amplify_flutter.dart';
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

  Future<String> uploadImage(File image) async {
    // Upload the file to S3
    try {
      final UploadFileResult result = await Amplify.Storage.uploadFile(
          local: image,
          key: 'ExampleKey',
          onProgress: (progress) {
            safePrint('Fraction completed: ${progress.getFractionCompleted()}');
          });
      safePrint('Successfully uploaded file: ${result.key}');
      return result.key;
    } on StorageException catch (e) {
      safePrint('Error uploading file: $e');
      return e.message;
    }
  }
}
