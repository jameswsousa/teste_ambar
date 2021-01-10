// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'git_repository_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GitRepositoryStore on _GitRepositoryStore, Store {
  final _$_repsFutureAtom = Atom(name: '_GitRepositoryStore._repsFuture');

  @override
  ObservableFuture<List<GitRepository>> get _repsFuture {
    _$_repsFutureAtom.context.enforceReadPolicy(_$_repsFutureAtom);
    _$_repsFutureAtom.reportObserved();
    return super._repsFuture;
  }

  @override
  set _repsFuture(ObservableFuture<List<GitRepository>> value) {
    _$_repsFutureAtom.context.conditionallyRunInAction(() {
      super._repsFuture = value;
      _$_repsFutureAtom.reportChanged();
    }, _$_repsFutureAtom, name: '${_$_repsFutureAtom.name}_set');
  }

  final _$repsAtom = Atom(name: '_GitRepositoryStore.reps');

  @override
  List<GitRepository> get reps {
    _$repsAtom.context.enforceReadPolicy(_$repsAtom);
    _$repsAtom.reportObserved();
    return super.reps;
  }

  @override
  set reps(List<GitRepository> value) {
    _$repsAtom.context.conditionallyRunInAction(() {
      super.reps = value;
      _$repsAtom.reportChanged();
    }, _$repsAtom, name: '${_$repsAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_GitRepositoryStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }
}
