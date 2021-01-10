import 'package:mobx/mobx.dart';
import 'package:teste_ambar/data/api.dart';
import 'package:teste_ambar/data/model/git_repository.dart';
import 'package:teste_ambar/errors/exceptions.dart';

part 'git_repository_store.g.dart';

class GitRepositoryStore = _GitRepositoryStore with _$GitRepositoryStore;

enum StoreState { initial, loading, loaded }

abstract class _GitRepositoryStore with Store {
  final Api _api;

  _GitRepositoryStore(this._api) {
    getList();
  }

  @observable
  ObservableFuture<List<GitRepository>> _repsFuture;

  @observable
  List<GitRepository> reps;

  @observable
  String errorMessage;

  @computed
  StoreState get state {
    if (_repsFuture == null || _repsFuture.status == FutureStatus.rejected) {
      return StoreState.initial;
    }

    return _repsFuture.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future getList() async {
    try {
      errorMessage = null;
      _repsFuture = ObservableFuture(_api.getList());
      reps = await _repsFuture;
    } on NoInternetException {
      errorMessage = 'Verifique sua conexão com a internet';
    } on DataException {
      errorMessage = 'Erro ao obter dados';
    } catch (e) {
      errorMessage = 'Houve um erro de comunicação';
    }
  }
}
