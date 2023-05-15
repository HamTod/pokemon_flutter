import 'package:mobx/mobx.dart';
import 'package:pokemon2/data/user_data.dart';

// Include generated file
part 'user_store.g.dart';

// This is the class used by rest of your codebase
class UserStore = _UserStore with _$UserStore;

// The store-class
abstract class _UserStore with Store {
  @observable
  List<UserData> userList = [];

  @action
  void setUserList(List<UserData> data) {
    userList = data;
  }
}
