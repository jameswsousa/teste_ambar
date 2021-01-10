import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_ambar/pages/homepage.dart';
import 'package:teste_ambar/state/git_repository_store.dart';

import 'data/api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Provider(
            child: MyHomePage(),
            create: (context) => GitRepositoryStore(Api())));
  }
}
