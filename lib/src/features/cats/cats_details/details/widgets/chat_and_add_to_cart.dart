import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constants/app_ui_padding.dart';

class ChatAndAddToCart extends StatelessWidget {
  const ChatAndAddToCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(kDefaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFCBF1E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            "assets/icons/chat.svg",
            height: 18,
          ),
          const SizedBox(width: kDefaultPadding / 2),
          const Text(
            "Chat",
            style: TextStyle(color: Colors.white),
          ),
          // it will cover all available spaces
          const Spacer(),
          FlatButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/contact.svg",
              height: 18,
            ),
            label: const Text(
              "Contact us",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
