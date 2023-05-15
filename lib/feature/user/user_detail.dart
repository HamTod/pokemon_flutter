import 'package:flutter/material.dart';
import 'package:pokemon2/data/user_data.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as UserData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name : ${user.name}'),
            Text('Email : ${user.email}'),
            Text('Phone : ${user.phone}')
          ],
        ),
      ),
    );
  }
}
