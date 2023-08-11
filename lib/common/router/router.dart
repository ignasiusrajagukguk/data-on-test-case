import 'package:data_on_test_case/common/router/routes.dart';
import 'package:data_on_test_case/view/detail_university/detail_university.dart';
import 'package:data_on_test_case/view/screen/home/home.dart';
import 'package:data_on_test_case/view/screen/login/login.dart';
import 'package:data_on_test_case/view/screen/register/register.dart';
import 'package:data_on_test_case/view/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route generateRoute(
      RouteSettings routeSettings, ScrollBehavior scrollBehavior) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        return ScrollConfiguration(
          behavior: scrollBehavior,
          child: _getScreen(
            settings: routeSettings,
          ),
        );
      },
    );
  }

  static Widget _getScreen({required RouteSettings settings}) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splash:
        return const Splash();
      case Routes.home:
        return const Home();
      case Routes.detailUniversity:
        UniversityDetailArgument? argument;
        if (args is UniversityDetailArgument) argument = args;
        return UniversityDetail(argument: argument!);
      case Routes.loginScreen:
        return const LoginScreen();
      case Routes.registerScreen:
        return const RegisterScreen();
      default:
        return Container();
    }
  }
}
