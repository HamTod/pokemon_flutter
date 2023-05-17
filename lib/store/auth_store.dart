import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'auth_store.g.dart';

// This is the class used by rest of your codebase
class AuthStore = _AuthStore with _$AuthStore;

enum Lang { thai, eng }

// The store-class
abstract class _AuthStore with Store {
  @observable
  User? user;

  @observable
  Lang language = Lang.thai;

  @action
  void setUser(User? data) {
    user = data;
  }

  @action
  void setLocale(Lang data) {
    language = data;
  }

  @computed
  Locale get lang {
    return language == Lang.thai ? const Locale('th') : const Locale('en');
  }
}
