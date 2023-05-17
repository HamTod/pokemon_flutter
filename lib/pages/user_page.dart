import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokemon2/app/app_routes.dart';
import 'package:pokemon2/data/post_data.dart';
import 'package:pokemon2/data/user_data.dart';
import 'package:pokemon2/feature/user/user_detail.dart';
import 'package:pokemon2/services/user_services.dart';
import 'package:pokemon2/store/user_store.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  StreamSubscription? subscription;

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context, listen: false);
    return Observer(builder: (context) {
      List<UserData> filteredUsers = userStore.userList
          .where(
              (element) => element.name.contains(searchController.value.text))
          .toList();
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ค้นหา',
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: filteredUsers
                  .map((e) => ListTile(
                        title: Text(e.name),
                        subtitle: Text(e.email),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          final list = userStore.postList
                              .where((element) => element.userId == e.id)
                              .toList();
                          Navigator.pushNamed(context, AppRoutes.userDetails,
                              arguments: UserDetailsArg(e, list));
                        },
                      ))
                  .toList(),
            ),
          ),
        ],
      );
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final userStore = Provider.of<UserStore>(context, listen: false);
      final userServices = UserServices();

      // ZipStream.zip2(
      //     Stream.fromFuture(userServices.fetchUser()),
      //     Stream.fromFuture(userServices.fetchPost()),
      //     (a, b) => [a, b]).listen((value) {
      //   final list1 = value[0] as List<UserData>;
      //   final list2 = value[1] as List<PostData>;
      //   userStore.setUserList(list1);
      //   userStore.setPostList(list2);
      // });

      subscription = CombineLatestStream.combine2(
          Stream.fromFuture(userServices.fetchUser()),
          Stream.fromFuture(userServices.fetchPost()),
          (a, b) => [a, b]).listen((value) {
        final list1 = value[0] as List<UserData>;
        final list2 = value[1] as List<PostData>;
        userStore.setUserList(list1);
        userStore.setPostList(list2);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }
}
