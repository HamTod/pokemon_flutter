import 'package:flutter/material.dart';
import 'package:pokemon2/app/app_routes.dart';
import 'package:pokemon2/pages/home_page.dart';
import 'package:pokemon2/pages/user_page.dart';

import 'bottom_nav.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  static final List<Widget> _pages = [
    const HomePage(),
    const UserPage(),
    const Center(child: Text('Text3')),
    const Center(child: Text('Text4')),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.map);
              },
              icon: const Icon(Icons.map))
        ],
      ),
      body: _pages[currentIndex],
      bottomNavigationBar: MyBottomNav(
        currentIndex: currentIndex,
        onTap: handleTap,
      ),
    );
  }

  handleTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
