import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cw_food_quality_tracking_system/LoginScreen.dart';
import 'package:flutter_cw_food_quality_tracking_system/core/model/my_app_user.dart';
import 'package:flutter_cw_food_quality_tracking_system/core/widgets/auth_widget.dart';
import 'package:flutter_cw_food_quality_tracking_system/core/widgets/auth_widget_builder.dart';
import 'package:flutter_cw_food_quality_tracking_system/firebase_options.dart';
import 'package:flutter_cw_food_quality_tracking_system/service/firebase_service.dart';
import 'package:flutter_cw_food_quality_tracking_system/service/i_auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IAuthService>(
          create: (_) => AuthService(),
        )
      ],
      child: AuthWidgetBuilder(
        onPageBuilder: (context, AsyncSnapshot<MyAppUser?> snapShot) =>
            MaterialApp(
          title: 'My App',
          debugShowCheckedModeBanner: false,
          home: AuthWidget(snapShot: snapShot),
        ),
      ),
    );
  }
}
