// ignore_for_file: use_key_in_widget_constructors

import 'package:ecommerce_app/src/features/cats/cats_home_page/widgets/home_screen_body.dart';
import 'package:ecommerce_app/src/features/cats/controllers/list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/app_ui_padding.dart';

class CatsHomeScreen extends StatelessWidget {
  static const routeName = '/catsscreen';
  @override
  Widget build(BuildContext context) {
    final ListController listController = Get.find();
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: KPrimaryColor,
      body: HomeScreenBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: const Text('Dashboard'),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/notification.svg"),
          onPressed: () {},
        ),
      ],
    );
  }
}
