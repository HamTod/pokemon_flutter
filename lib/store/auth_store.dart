import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'auth_store.g.dart';

// This is the class used by rest of your codebase
class AuthStore = _AuthStore with _$AuthStore;

// The store-class
abstract class _AuthStore with Store {
  @observable
  User? user;

  @action
  void setUser(User? data) {
    user = data;
  }
}
