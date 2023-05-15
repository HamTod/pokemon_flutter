import 'package:flutter/material.dart';

final List<BottomNavItem> listBottomIcon = [
  BottomNavItem(title: 'หน้าแรก', icon: Icons.home),
  BottomNavItem(title: 'หน้าสอง', icon: Icons.access_alarm),
  BottomNavItem(title: 'หน้าสาม', icon: Icons.access_alarm),
  BottomNavItem(title: 'หน้าสี่', icon: Icons.access_alarm)
];

class MyBottomNav extends StatelessWidget {
  final int currentIndex;

  final Function(int)? onTap;

  const MyBottomNav({Key? key, required this.currentIndex, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTap,
        items: listBottomIcon
            .map((e) =>
                BottomNavigationBarItem(icon: Icon(e.icon), label: e.title))
            .toList());
  }
}

class BottomNavItem {
  final String title;

  final IconData icon;

  BottomNavItem({required this.title, required this.icon});
}
