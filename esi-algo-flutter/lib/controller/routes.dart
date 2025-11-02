import 'package:esi_algo/view/home.dart';
import 'package:esi_algo/view/screens/auth/sign_in.dart';
import 'package:esi_algo/view/screens/auth/sign_up.dart';
import 'package:esi_algo/view/screens/problem/problem_set.dart';
import 'package:get/get.dart';

class RouteClass {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String live = '/live';
  static const String problemSet = '/problem-set';

  static String getHome() {
    return home;
  }

  static String getLogin() {
    return login;
  }

  static String getRegister() {
    return register;
  }

  static String getProblemSet() {
    return problemSet;
  }

  static List<GetPage> routes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: register, page: () => const SignUpPage()),
    GetPage(name: problemSet, page: () => ProblemSetPage()),
  ];
}
