import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:teste_ambar/errors/exceptions.dart';

import 'model/git_repository.dart';

class Api {
  Future<List<GitRepository>> getList() async {
    if (await DataConnectionChecker().hasConnection) {
      http.Response response;
      List<GitRepository> repositories = [];
      response = await http.get('https://api.github.com/repositories');

      if (response.statusCode == 200) {
        json.decode(response.body).map((rep) {
          repositories.add(GitRepository.fromJson(rep));
        }).toList();
        return repositories;
      } else {
        throw DataException();
      }
    } else {
      throw NoInternetException();
    }
  }
}
