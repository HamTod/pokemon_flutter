import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final usernameController = TextEditingController(text: 'aaa@mail.com');
  final passwordController = TextEditingController(text: '12345678');
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Log In')),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: usernameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
              labelText: 'Password',
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              try {
                await _auth.signInWithEmailAndPassword(
                    email: usernameController.value.text,
                    password: passwordController.value.text);
              } catch (err, s) {
                print(err);
                print(s);
              }
            },
            child: const Text('submit'))
      ]),
    );
  }
}
