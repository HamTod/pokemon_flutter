import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokemon2/app/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SPLASH'),
      ),
      body: const Center(
        child: Column(
          children: [Text('Loading...')],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final auth = FirebaseAuth.instance;
      final user = auth.currentUser;

      if (user != null) {
        Navigator.pushReplacementNamed(context, AppRoutes.root);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }
      print(user);
    });
  }
}
