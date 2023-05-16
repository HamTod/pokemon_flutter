import 'package:pokemon2/app/root.dart';
import 'package:pokemon2/feature/auth/login_page.dart';
import 'package:pokemon2/feature/map/map_page.dart';
import 'package:pokemon2/feature/user/user_detail.dart';

class AppRoutes {
  static const String root = "/root";
  static const String login = "/login";
  static const String userDetails = '/userDetails';
  static const String map = '/map';

  routes() {
    return {
      root: (context) => const Root(),
      login: (context) => const LogIn(),
      userDetails: (context) => const UserDetail(),
      map: (context) => const MapPage(),
    };
  }
}
