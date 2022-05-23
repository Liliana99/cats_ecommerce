import 'package:ecommerce_app/src/features/cats/cats_details/details/widgets/color_dots.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_ui_padding.dart';

class ListOfColors extends StatelessWidget {
  const ListOfColors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          ColorDot(
            fillColor: Color(0xFF80989A),
            isSelected: true,
          ),
          ColorDot(
            fillColor: Color(0xFFFF5200),
          ),
          ColorDot(
            fillColor: KPrimaryColor,
          ),
        ],
      ),
    );
  }
}
