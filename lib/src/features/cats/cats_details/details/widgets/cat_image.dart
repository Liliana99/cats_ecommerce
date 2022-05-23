import 'package:flutter/material.dart';

import '../../../../../constants/app_ui_padding.dart';

class CatPoster extends StatelessWidget {
  const CatPoster({
    Key? key,
    @required this.size,
    this.image,
  }) : super(key: key);

  final Size? size;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      // the height of this container is 80% of our width
      height: size!.width * 0.8,

      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: size!.width * 0.7,
            width: size!.width * 0.7,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          Image.asset(
            image!,
            height: size!.width * 0.75,
            width: size!.width * 0.75,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
