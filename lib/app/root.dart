import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokemon2/app/app_routes.dart';
import 'package:pokemon2/pages/animal_page.dart';
import 'package:pokemon2/pages/home_page.dart';
import 'package:pokemon2/pages/notification_page.dart';
import 'package:pokemon2/pages/setting_page.dart';
import 'package:pokemon2/pages/user_page.dart';
import 'package:pokemon2/store/user_store.dart';
import 'package:pokemon2/theme/theme.dart';
import 'package:pokemon2/tools/notification.dart';
import 'package:provider/provider.dart';

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
    const AnimalPage(),
    const NotificationPage(),
    const SettingPage(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(getAppBarTitle()), //ชื่อAppBar แต่ละหน้า ตามเมนูด้านล่าง
        actions: [
          if (currentIndex == 1)
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.map);
                },
                icon: const Icon(Icons.map)),
          if (currentIndex == 4)
            IconButton(
                onPressed: () {
                  userStore.setCurrentTheme(!userStore.isDark);
                },
                icon: Icon(userStore.currentTheme == MyThemes.darkTheme
                    ? Icons.light
                    : Icons.nightlight))
        ],
      ),
      body: _pages[currentIndex],

      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showNotification();
          },
          child: const Icon(Icons.notification_add)),
      bottomNavigationBar: MyBottomNav(
        currentIndex: currentIndex,
        onTap: handleTap,
      ),
    );
  }

  ///เมนูด้านล่าง
  getAppBarTitle() {
    final appText = AppLocalizations.of(context)!;
    if (currentIndex == 0) {
      return appText.homePage;
    } else if (currentIndex == 1) {
      return appText.userPage;
    } else if (currentIndex == 2) {
      return appText.animalPage;
    } else if (currentIndex == 3) {
      return 'notification';
    } else if (currentIndex == 4) {
      return appText.settingPage;
    }
  }

  handleTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
