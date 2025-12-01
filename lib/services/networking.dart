import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper{
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    try {
      var uri = Uri.parse(url);
      Response response = await get(uri);

      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      Exception(e);
    }
  }
}