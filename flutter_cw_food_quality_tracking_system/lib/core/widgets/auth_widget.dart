import 'package:flutter/material.dart';
import 'package:flutter_cw_food_quality_tracking_system/core/model/my_app_user.dart';
import 'package:flutter_cw_food_quality_tracking_system/core/widgets/error_page.dart';
import 'package:flutter_cw_food_quality_tracking_system/view/home_page.dart';
import 'package:flutter_cw_food_quality_tracking_system/view/sign_in_page.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key, required this.snapShot}) : super(key: key);
  final AsyncSnapshot<MyAppUser?> snapShot;

  @override
  Widget build(BuildContext context) {
    if (snapShot.connectionState == ConnectionState.active) {
      return snapShot.hasData ? const HomePage() : const SignInPage();
    }

    return ErrorPage();
  }
}
