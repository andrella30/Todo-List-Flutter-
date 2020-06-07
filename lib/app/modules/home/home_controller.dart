import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/shared/repositories/localstorage/local_storage_interface.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ILocalStorage _storage = Modular.get();

  @observable
  String text = '';

  @observable
  bool check = false;

  @action
  setcheck(value) => check = value; 

  @action
  setText(String value) => text = value;

  @observable
  ObservableList<String> list = <String>[].asObservable();

  @observable
  ObservableList<String> mainList = <String>[].asObservable();

  @action
  mainInit() async {
    List<String> listLocal = await _storage.get('main');
    
    if (listLocal == null) {
      initBoxes();
      mainList = <String>[].asObservable();
    } else {
      mainList = listLocal.asObservable();
    }
  }

  @action
  initBoxes() async {
    mainList.add('All');
    mainList.add('Work');
    mainList.add('Study');
    mainList.add('Home');
    _storage.put('main', mainList);
  }

  @action
  void mainSave() {
    mainList.add(text);
    _storage.put('main', mainList);
  }

  @action
  void mainRemove(int index) {
    mainList.removeAt(index);
    _storage.put('main', mainList);
  }

  @action
  init(String name) async {
    List<String> listLocal = await _storage.get(name);
    if (listLocal == null) {
      list = <String>[].asObservable();
    } else {
      list = listLocal.asObservable();
    }
  }

  @action
  void save(String name) {
    list.add(text);
    _storage.put(name, list);
  }

  @action
  void remove(int index, String name) {
    list.removeAt(index);
    _storage.put(name, list);
  

  }

  @action
  edit(int index, String name) {
    list.removeAt(index);
    _storage.put(name, list);
    list.insert(index, text);
  }
}
