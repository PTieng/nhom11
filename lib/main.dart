import 'package:flutter/material.dart';
import 'package:flutter_application_1/login/login_screen.dart';
import 'package:flutter_application_1/login/signup_screen.dart';
import 'package:flutter_application_1/service/theme_service.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'UI/home.dart';
import 'UI/theme.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: ThemeService().theme,
        home: LoginPage());
  }
}
