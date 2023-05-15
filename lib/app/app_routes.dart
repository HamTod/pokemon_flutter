import 'package:pokemon2/app/root.dart';
import 'package:pokemon2/feature/auth/login_page.dart';
import 'package:pokemon2/feature/user/user_detail.dart';

class AppRoutes {
  static const String root = "/root";
  static const String login = "/login";
  static const String userDetails = '/userDetails';

  routes() {
    return {
      root: (context) => const Root(),
      login: (context) => const LogIn(),
      userDetails: (context) => const UserDetail()
    };
  }
}
