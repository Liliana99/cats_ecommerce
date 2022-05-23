// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:ecommerce_app/src/constants/breakpoints.dart';
import 'package:ecommerce_app/src/features/cats/cats_home_page/cats_home_screen.dart';

import 'package:ecommerce_app/src/util/screen_uitl.dart';
import 'package:ecommerce_app/src/util/text_color.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isInitialized = false;

  _showHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, CatsHomeScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    _showHome();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: true);
    const _pic = 'tenor.gif';
    final screenWidth = MediaQuery.of(context).size.width;
    double myWidth = (screenWidth == Breakpoint.desktop) ? 50 : 100;
    return Scaffold(
      //  resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            width: myWidth,
            child: Image.asset(
              'assets/images/$_pic',
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: TextColor().textColor(context)),
        ],
      ),
    );
  }
}
