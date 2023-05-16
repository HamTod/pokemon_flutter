// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  late final _$userListAtom =
      Atom(name: '_UserStore.userList', context: context);

  @override
  List<UserData> get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(List<UserData> value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  late final _$postListAtom =
      Atom(name: '_UserStore.postList', context: context);

  @override
  List<PostData> get postList {
    _$postListAtom.reportRead();
    return super.postList;
  }

  @override
  set postList(List<PostData> value) {
    _$postListAtom.reportWrite(value, super.postList, () {
      super.postList = value;
    });
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  void setUserList(List<UserData> data) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setUserList');
    try {
      return super.setUserList(data);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPostList(List<PostData> data) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setPostList');
    try {
      return super.setPostList(data);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userList: ${userList},
postList: ${postList}
    ''';
  }
}
