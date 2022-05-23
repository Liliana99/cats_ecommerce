// ignore_for_file: import_of_legacy_library_into_null_safe, use_key_in_widget_constructors

import 'package:ecommerce_app/src/constants/app_ui_padding.dart';
import 'package:ecommerce_app/src/features/cats/cats_home_page/cats_home_screen.dart';
import 'package:ecommerce_app/src/features/cats/splash_page/splash_screen.dart';

import 'package:ecommerce_app/src/features/cats/controllers/bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final ThemeData theme = ThemeData();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cat Flutter App',
        initialBinding: ListBinding(),
        theme: ThemeData(
          // We set Poppins as our default font
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          primaryColor: KPrimaryColor,
          colorScheme: theme.colorScheme.copyWith(
            primary: KPrimaryColor,
            secondary: KPrimaryColor,
          ),

          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (_) => SplashScreen(),
          CatsHomeScreen.routeName: (_) => CatsHomeScreen(),
        });
  }
}
