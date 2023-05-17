import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<BottomNavItem> listBottomIcon(AppLocalizations appText) {
  return [
    BottomNavItem(title: appText.homePage, icon: Icons.home),
    BottomNavItem(title: appText.userPage, icon: Icons.account_box_rounded),
    BottomNavItem(title: appText.animalPage, icon: Icons.list),
    BottomNavItem(title: appText.settingPage, icon: Icons.settings)
  ];
}

class MyBottomNav extends StatelessWidget {
  final int currentIndex;

  final Function(int)? onTap;

  const MyBottomNav({Key? key, required this.currentIndex, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTap,
        items: listBottomIcon(appText)
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
