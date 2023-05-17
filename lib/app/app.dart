import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokemon2/app/app_routes.dart';
import 'package:pokemon2/feature/auth/splash_screen.dart';
import 'package:pokemon2/store/auth_store.dart';
import 'package:pokemon2/store/user_store.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context, listen: false);
    return Observer(builder: (context) {
      return MaterialApp(
        title: 'Flutter Demo',
        routes: AppRoutes().routes(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        locale: authStore.lang,
        home: const SplashScreen(),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final authStore = Provider.of<AuthStore>(context, listen: false);
      _auth.authStateChanges().doOnData((user) {
        authStore.setUser(user);
        print(user);
      });
    });
  }
}

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthStore>(create: (_) => AuthStore()),
        Provider<UserStore>(create: (_) => UserStore()),
      ],
      child: const MyApp(),
    );
  }
}
