import 'package:ecommerce_app/src/features/cats/cats_details/details/widgets/body.dart';
import 'package:ecommerce_app/src/models/cat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/app_ui_padding.dart';
import '../../../../constants/keys_test.dart';

class DetailsScreen extends StatelessWidget {
  final Cat? cat;

  const DetailsScreen({Key? key, this.cat}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryColor,
      appBar: buildAppBar(context),
      body: Body(
        cat: cat,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        key: const Key(Keys.backButton),
        padding: const EdgeInsets.only(left: kDefaultPadding),
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            "assets/icons/back_arrow.svg",
            fit: BoxFit.contain,
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text(
        'Back'.toUpperCase(),
        style: Theme.of(context).textTheme.bodyText2,
      ),
      actions: <Widget>[
        IconButton(
          icon: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SvgPicture.asset(
              'assets/icons/contact.svg',
              fit: BoxFit.contain,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
