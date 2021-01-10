import 'package:mobx/mobx.dart';
import 'package:teste_ambar/data/api.dart';
import 'package:teste_ambar/data/model/git_repository.dart';

part 'git_repository_store.g.dart';

class GitRepositoryStore = _GitRepositoryStore with _$GitRepositoryStore;

abstract class _GitRepositoryStore with Store {
  final Api _api;

  _GitRepositoryStore(this._api);

  @observable
  ObservableFuture<List<GitRepository>> _repsFuture;

  @observable
  List<GitRepository> reps;

  @observable
  String errorMessage;
}
