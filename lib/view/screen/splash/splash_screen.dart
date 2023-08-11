import 'package:data_on_test_case/common/colors.dart';
import 'package:data_on_test_case/common/constants/assets_image.dart';
import 'package:data_on_test_case/common/router/routes.dart';
import 'package:data_on_test_case/view_model/shared_preferences/prefrences_key.dart';
import 'package:data_on_test_case/view_model/shared_preferences/shared_prefrences_utils.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    initialized();
    return Scaffold(
      backgroundColor: ConstColors.dark50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(assetsDotaIcon, height: 120),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  initialized() async {
    String? loggedInChache =
        await SharedPreferencesUtils.getString(preferencesLoggedIn);

    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (loggedInChache == 'isLoggedIn') {
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.home,
          (route) => false,
        );
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.loginScreen,
          (route) => false,
        );
      }
    });
  }
}
