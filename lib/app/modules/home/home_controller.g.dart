// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$textAtom = Atom(name: '_HomeControllerBase.text');

  @override
  String get text {
    _$textAtom.context.enforceReadPolicy(_$textAtom);
    _$textAtom.reportObserved();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.context.conditionallyRunInAction(() {
      super.text = value;
      _$textAtom.reportChanged();
    }, _$textAtom, name: '${_$textAtom.name}_set');
  }

  final _$checkAtom = Atom(name: '_HomeControllerBase.check');

  @override
  bool get check {
    _$checkAtom.context.enforceReadPolicy(_$checkAtom);
    _$checkAtom.reportObserved();
    return super.check;
  }

  @override
  set check(bool value) {
    _$checkAtom.context.conditionallyRunInAction(() {
      super.check = value;
      _$checkAtom.reportChanged();
    }, _$checkAtom, name: '${_$checkAtom.name}_set');
  }

  final _$listAtom = Atom(name: '_HomeControllerBase.list');

  @override
  ObservableList<String> get list {
    _$listAtom.context.enforceReadPolicy(_$listAtom);
    _$listAtom.reportObserved();
    return super.list;
  }

  @override
  set list(ObservableList<String> value) {
    _$listAtom.context.conditionallyRunInAction(() {
      super.list = value;
      _$listAtom.reportChanged();
    }, _$listAtom, name: '${_$listAtom.name}_set');
  }

  final _$mainListAtom = Atom(name: '_HomeControllerBase.mainList');

  @override
  ObservableList<String> get mainList {
    _$mainListAtom.context.enforceReadPolicy(_$mainListAtom);
    _$mainListAtom.reportObserved();
    return super.mainList;
  }

  @override
  set mainList(ObservableList<String> value) {
    _$mainListAtom.context.conditionallyRunInAction(() {
      super.mainList = value;
      _$mainListAtom.reportChanged();
    }, _$mainListAtom, name: '${_$mainListAtom.name}_set');
  }

  final _$mainInitAsyncAction = AsyncAction('mainInit');

  @override
  Future mainInit() {
    return _$mainInitAsyncAction.run(() => super.mainInit());
  }

  final _$initBoxesAsyncAction = AsyncAction('initBoxes');

  @override
  Future initBoxes() {
    return _$initBoxesAsyncAction.run(() => super.initBoxes());
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future init(String name) {
    return _$initAsyncAction.run(() => super.init(name));
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setcheck(dynamic value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setcheck(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setText(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setText(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void mainSave() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.mainSave();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void mainRemove(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.mainRemove(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void save(String name) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.save(name);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(int index, String name) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.remove(index, name);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic edit(int index, String name) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.edit(index, name);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'text: ${text.toString()},check: ${check.toString()},list: ${list.toString()},mainList: ${mainList.toString()}';
    return '{$string}';
  }
}
