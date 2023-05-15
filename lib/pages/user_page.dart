import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokemon2/app/app_routes.dart';
import 'package:pokemon2/services/user_services.dart';
import 'package:pokemon2/store/user_store.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context, listen: false);
    return Observer(builder: (context) {
      return ListView(
        children: userStore.userList
            .map((e) => ListTile(
                  title: Text(e.name),
                  subtitle: Text(e.email),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.userDetails,
                        arguments: e);
                  },
                ))
            .toList(),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final userStore = Provider.of<UserStore>(context, listen: false);
      final userServices = UserServices();
      final list = await userServices.fetchData();
      userStore.setUserList(list);
    });
  }
}
