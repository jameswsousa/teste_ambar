import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<List> getMap() async {
    http.Response response;
    response = await http.get('https://api.github.com/repositories');
    return json.decode(response.body);
  }
}
