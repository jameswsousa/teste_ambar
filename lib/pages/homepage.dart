import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:teste_ambar/data/model/git_repository.dart';
import 'package:teste_ambar/state/git_repository_store.dart';
import 'package:teste_ambar/widgets/custom_loading_widget.dart';
import 'package:teste_ambar/widgets/repocard.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GitRepositoryStore _gitRepositoryStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _gitRepositoryStore ??= Provider.of<GitRepositoryStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffffffc),
        appBar: AppBar(
          title: Text('Teste Ambar'),
          centerTitle: true,
          backgroundColor: Color(0xff0d1821),
        ),
        body: Observer(builder: (_) {
          if (_gitRepositoryStore.errorMessage != null) {
            return buildError(_gitRepositoryStore.errorMessage);
          }

          switch (_gitRepositoryStore.state) {
            case StoreState.initial:
              return buildLoading();
            case StoreState.loading:
              return buildLoading();
            case StoreState.loaded:
              return buildList(_gitRepositoryStore.reps);
          }
        }));
  }

  Center buildLoading() {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        alignment: Alignment.center,
        child: CustomLoadingWidget(),
      ),
    );
  }

  Center buildError(String errorMessage) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            padding: EdgeInsets.all(15),
            elevation: 10,
            color: Color(0xff9bf6ff),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              _gitRepositoryStore.getList();
            },
            child: Text(
              'Tentar novamente',
              style: TextStyle(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }

  Widget buildList(List<GitRepository> reps) {
    return ListView.builder(
      itemCount: reps.length,
      itemBuilder: (context, index) => RepoCard(
        avatar: reps[index].avatar,
        name: reps[index].name,
        owner: reps[index].owner,
        repUrl: reps[index].repUrl,
      ),
    );
  }
}
