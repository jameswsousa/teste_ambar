import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:teste_ambar/git_repository.dart';

class Api {
  Future<List<GitRepository>> getList() async {
    http.Response response;
    List<GitRepository> repositories = [];
    response = await http.get('https://api.github.com/repositories');
    json.decode(response.body).map((rep) {
      repositories.add(GitRepository.fromJson(rep));
    }).toList();
    return repositories;
  }
}
